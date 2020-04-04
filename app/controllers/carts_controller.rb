class CartsController < ApplicationController
  before_action :set_cart_for_add_product, only: [
    :product_to_cart,
    :delete_product_from_cart,
    :delete_all_products_from_cart,
  ]

  def show
    @cart = Cart.find(params[:id]) if params[:id]
  end

  def product_to_cart
    @product = Product.find(params[:product_id])
    product_in_cart = @cart.cart_products.find_or_create_by(product_id: @product.id)
    if params[:product_count]
      product_in_cart.update(product_count: params[:product_count])
    else
      if product_in_cart.product_count == nil or product_in_cart.product_count < @product.quantity
        product_in_cart.increment!(:product_count)
      end
      end
    product_in_cart.update(total_product_sum: product_in_cart.product_count * product_in_cart.product.price)
    respond_to do |format|
      format.js
    end
  end

  def delete_product_from_cart
    @cart_product = @cart.cart_products.find(params[:cart_products_id])
    @cart_product.delete
    respond_to do |format|
      format.js
    end
  end

  def delete_all_products_from_cart
    @cart.cart_products.delete_all
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  private
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
