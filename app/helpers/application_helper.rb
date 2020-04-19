module ApplicationHelper
  def categories
    Category.all
  end

  def app_images
    AppImage.all
  end

  def carousel_images
    CarouselImage.all
  end

  def current_cart
    cart_id = session[:current_cart_id]
    Cart.find(session[:current_cart_id]) if cart_id
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
