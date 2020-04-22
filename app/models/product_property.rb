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

  scope :processor, -> {find_by(property: Property.processor)}
  scope :ram_size, -> {find_by(property: Property.ram_size)}
  scope :ram_type, -> { find_by(property: Property.ram_type) }
  scope :hdd_size, -> { find_by(property: Property.hdd_size) }
  scope :ssd_size, -> { find_by(property: Property.ssd_size) }
  scope :video_chiset, -> { find_by(property: Property.video_chiset) }
end
