class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

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
    user = User.find_or_create_by(email: params[:email])
    user.update(
      phone: params[:phone],
      first_name: params[:first_name],
      last_name: params[:last_name],
      city: params[:city],
      departament: params[:departament])
    @order = Order.new(user_id: user.id, cart_id: session[:current_cart_id], status: 'Новый')
    @order.update(order_params)
    sign_in(user)
    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: 'Заказ №'+ @order.id + 'успешно создан. В близжайшее время с Вами свяжется менеджер.' }
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
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
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
      @order.update(status: 'Отменен')
      redirect_to orders_path, notice: 'Заказ №' + @order.id.to_s + ' успешно отменен.'
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

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:cart_id, :user_id, :payment, :status, :discription, :delivery)
    end
end
