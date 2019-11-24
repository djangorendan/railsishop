class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  has_one :order

  def total_product_count
    cart_products.sum(:product_count)
  end

  def total_cart_sum
    cart_products.sum(:total_product_sum)
  end

end
