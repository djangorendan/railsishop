class ProductProperty < ApplicationRecord
  belongs_to :product
  belongs_to :property

  scope :grouped_with_product_count, -> () {
    select(
      "COUNT(products.id) AS products_count, property_id"
    ).joins(
      "LEFT JOIN products ON products.id = product_properties.product_id"
    ).grouped
  }

  scope :grouped, -> () {
    select(:value).group(:value, :property_id)
  }
end
