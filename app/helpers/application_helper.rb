module ApplicationHelper
  def categories
    Category.all
  end

  def carts_products_count
    cart_id = session[:current_cart_id]
    Cart.find(cart_id).total_product_count if cart_id
  end

  def filter_checked? prorerties, name
    return false unless prorerties.present?
    prorerties.split(',').index(name).present?
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
