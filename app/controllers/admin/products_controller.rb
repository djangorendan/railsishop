class Admin::ProductsController < ApplicationController
  layout "admin"

  before_action :authenticate_admin!
  before_action :set_product, only: [:edit, :update, :destroy, :create_summary]

  after_action :create_product_properties, only: :create
  after_action :create_summary, only: :update

  has_scope :displayed, type: :boolean
  has_scope :not_displyed, type: :boolean
  has_scope :by_category

  # GET /products
  # GET /products.json
  def index
    @products = apply_scopes(Product).all
    @categories = Category.all
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
    if @product.category.name == 'Ноутбуки' || @product.category.name == 'Системные блоки'
      processor = @product.product_properties.processor.value.to_s
      ram_size = @product.product_properties.ram_size.value.to_s
      ram_type = @product.product_properties.ram_type.value.to_s
      hdd_size = @product.product_properties.hdd_size.value.to_s
      ssd_size = @product.product_properties.ssd_size.value.to_s
      video_chiset = @product.product_properties.video_chiset.value.to_s
      video_ram_size = @product.product_properties.video_ram_size.value.to_s
    end
    if @product.category.name == 'Ноутбуки'
      screen_size = @product.product_properties.screen_size.value.to_s
      screen_resolution = @product.product_properties.screen_resolution.value.to_s
    end

    if hdd_size.blank?
      rom = 'SSD' + ' ' + ssd_size
    else
      unless ssd_size.blank?
        rom = 'SSD' + ' ' + ssd_size + ' + ' + 'HDD' + ' ' + hdd_size
      else
        rom = 'HDD' + ' ' + hdd_size
      end
    end

    video_chiset = video_chiset + ' - ' + video_ram_size unless video_ram_size.blank?

    if @product.category.name == 'Ноутбуки'
      @product.update(summary: 'Экран ' + screen_size + ' (' + screen_resolution + ')' + '/' + processor + '/' + ram_size + ' ' + ram_type + '/' + rom.to_s + '/' + video_chiset.to_s)
    elsif @product.category.name == 'Системные блоки'
      @product.update(summary: processor + '/' + ram_size + ' ' + ram_type + '/' + rom.to_s + '/' + video_chiset.to_s)
    end
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
