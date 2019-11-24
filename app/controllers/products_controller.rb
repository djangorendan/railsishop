class ProductsController < ApplicationController
  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.friendly.find(params[:id])
  end
end
