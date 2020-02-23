class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create]

  after_action :update_product_quantity, only: [:create]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.order(id: :desc).where(user_id: current_user)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @cart = Cart.find(session[:current_cart_id])
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(user_id: @user.id, cart_id: session[:current_cart_id], status: 'Новый')
    @order.update(order_params)
    unless params[:address].blank?
      departament = params[:address] + params[:house] + params[:apartment]
      @order.update(departament: departament)
    end
    OrderMailer.with(order: @order).new_order.deliver_now
    OrderMailer.with(order: @order).new_order_admin.deliver_now

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: 'Заказ №'+ @order.id.to_s + ' успешно создан. В близжайшее время с Вами свяжется менеджер.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path, notice: 'Заказ успешно обновлен' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def cancel
    @order = Order.find(params[:order_id])
      if @order.status != 'Отменен'
        @order.cart.cart_products.each do |cart_product|
          product = Product.find(cart_product.product.id)
          product.quantity += cart_product.product_count
          product.display = true unless product.display
          product.save
        end
      end
      @order.update(status: 'Отменен', discription: params[:reason])
      redirect_to orders_path, notice: 'Заказ №' + @order.id.to_s + ' успешно отменен.'
      OrderMailer.with(order: @order).cancel_order.deliver_now
  end

  private
    def update_product_quantity
      @order.cart.cart_products.each do |cart_product|
        product = Product.find(cart_product.product.id)
        product.quantity -= cart_product.product_count
        product.display = product.quantity > 0
        product.save
      end
      session[:current_cart_id] = nil
    end

    def set_user
      password = Devise.friendly_token(8)
      password_confirmation = password
      @user = User.create_with(
        phone: params[:order][:phone],
        first_name: params[:order][:first_name],
        last_name: params[:order][:last_name],
        city: params[:order][:city],
        departament: params[:order][:departament],
        password: password
      ).find_or_initialize_by(email: params[:order][:email])
      if @user.new_record?
        @user.save
        UserMailer.with(user: @user, password: password).welcome_mail.deliver_now
      end
      sign_in(@user)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:cart_id, :user_id, :payment, :status, :discription, :delivery, :phone, :email, :first_name, :last_name, :city, :departament)
    end
end
