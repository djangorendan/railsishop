class CategoriesController < ApplicationController
  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.friendly.find(params[:id])
    @products = @category.products.displayed.filter_by_category(params["/categories/#{params[:id]}"]).page(params[:page] || 1)
    set_filter_params
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_filter_params
    return unless params["/categories/#{params[:id]}"]
    set_variables(params["/categories/#{params[:id]}"])
    # params['/categories'][:product_properties].split(',').each do |product_propertie|
    #   instance_variable_set("@#{product_propertie}", true)
    # end
  end

end
