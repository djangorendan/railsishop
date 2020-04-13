class Admin::ProductsController < ApplicationController
  layout "admin"

  before_action :set_product, only: [:edit, :update, :destroy, :create_summary]
  after_action :create_product_properties, only: :create
  after_action :create_summary, only: :update

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to edit_admin_product_path(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to edit_admin_product_path(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_summary
    model_processor = @product.properties.model_processor.product_properties.first.value
    ram_size = @product.properties.ram_size.product_properties.first.value
    ram_type = @product.properties.ram_type.product_properties.first.value
    rom_size = @product.properties.rom_size.product_properties.first.value
    rom_type = @product.properties.rom_type.product_properties.first.value
    video_chiset = @product.properties.video_chiset.product_properties.first.value

    @product.update(summary: model_processor + '/' + ram_size + ' ' + ram_type + '/' + rom_type + ' ' + rom_size + '/' + video_chiset)
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def create_product_properties
      @product.category.properties.each do |property|
        property.subtree.each do |product_property|
          @product.product_properties.create(property_id: product_property.id)
        end
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :category_id, :summary, :display, :discription, :price, :quantity,
        product_properties_attributes: [:id, :value])
    end
end
