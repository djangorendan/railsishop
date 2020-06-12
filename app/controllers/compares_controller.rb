class ComparesController < ApplicationController
  before_action :set_compare, only: [:show, :edit, :update, :destroy]

  before_action :set_compare_for_add_product, only: [:product_to_compare, :delete_product_from_compare]

  # GET /compares
  # GET /compares.json
  def index
    @compares = Compare.all
  end

  # GET /compares/1
  # GET /compares/1.json
  def show
  end

  # GET /compares/new
  def new
    @compare = Compare.new
  end

  # GET /compares/1/edit
  def edit
  end

  # POST /compares
  # POST /compares.json
  def create
    @compare = Compare.new(compare_params)

    respond_to do |format|
      if @compare.save
        format.html { redirect_to @compare, notice: 'Compare was successfully created.' }
        format.json { render :show, status: :created, location: @compare }
      else
        format.html { render :new }
        format.json { render json: @compare.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compares/1
  # PATCH/PUT /compares/1.json
  def update
    respond_to do |format|
      if @compare.update(compare_params)
        format.html { redirect_to @compare, notice: 'Compare was successfully updated.' }
        format.json { render :show, status: :ok, location: @compare }
      else
        format.html { render :edit }
        format.json { render json: @compare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compares/1
  # DELETE /compares/1.json
  def destroy
    @compare.destroy
    respond_to do |format|
      format.html { redirect_to compares_url, notice: 'Compare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def product_to_compare
    @product = Product.find(params[:product_id])
    @product_in_compare = @compare.compare_products.find_or_create_by(product_id: @product.id)
    respond_to do |format|
      format.js
    end
  end

  def delete_product_from_compare
    @product = Product.find(params[:product_id])
    @compare.compare_products.find_by(product_id: @product.id).delete
    respond_to do |format|
      format.js
    end
  end

  private
    def set_compare_for_add_product
      if session[:current_compare_id]
        @compare = Compare.find_by_id(session[:current_compare_id])
      end
      if session[:current_compare_id].nil?
        @compare = Compare.create!
        session[:current_compare_id] = @compare.id
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_compare
      @compare = Compare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compare_params
      params.fetch(:compare, {})
    end
end
