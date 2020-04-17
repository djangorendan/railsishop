class Admin::PropertiesController < ApplicationController
  layout "admin"

  before_action :authenticate_admin!
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @properties = Property.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @property = Property.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to admin_properties_path, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to admin_properties_path, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @Property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to admin_properties_path, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:name, :position, :parent_id, :display_filter, :display_product)
    end
end
