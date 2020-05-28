class CartsController < ApplicationController
  layout "etc"

  before_action :set_cart_for_add_product, only: [
    :product_to_cart,
    :delete_product_from_cart,
    :delete_all_products_from_cart,
  ]

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def product_to_cart
    @product = Product.find(params[:product_id])
    @product_in_cart = @cart.cart_products.find_or_create_by(product_id: @product.id)
    @add_product_count = params[:product_count]&.to_i || 1
    @add_in_cart_modal = params[:add_in_cart_modal]

    respond_to do |format|
      if can_add_product_into_cart?
        @product_in_cart.update(product_count: @add_product_count) if params[:product_count]
        @product_in_cart.increment!(:product_count, @add_product_count) unless params[:product_count]
        @total_product_sum = @product_in_cart.product_count * @product_in_cart.product.price
        @product_in_cart.update(total_product_sum: @total_product_sum)
        format.js
      else
        format.js {render :product_to_cart_error}
      end
    end

  end

  def delete_product_from_cart
    @cart_product = @cart.cart_products.find(params[:cart_products_id])
    @cart_product.delete
    respond_to do |format|
      format.js
    end
  end

  private
    def can_add_product_into_cart?
      params[:product_count] && @add_product_count <= @product.quantity ||
      @add_product_count + (@product_in_cart.product_count || 0) <= @product.quantity
    end

    def set_cart_for_add_product
      if session[:current_cart_id]
        @cart = Cart.find_by_id(session[:current_cart_id])
      end
      if session[:current_cart_id].nil?
        @cart = Cart.create!
        session[:current_cart_id] = @cart.id
      end
    end

    def cart_params
      params.fetch(:cart, {})
    end
end
