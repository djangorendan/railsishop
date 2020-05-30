class ProductProperty < ApplicationRecord
  belongs_to :product
  belongs_to :property

  scope :grouped_with_product_count, -> (category_id) {
    select(
      "COUNT(products.id) AS products_count, property_id"
    ).joins(
      "LEFT JOIN products ON products.id = product_properties.product_id"
    ).grouped.have_values.where('products.display = true AND products.category_id = ?', category_id)
  }

  scope :grouped, -> () {
    select(:value, :property_id).group(:value, :property_id)
  }

  scope :have_values, -> { where.not(value: "") }

  scope :product_type, -> { find_by(property: Property.product_type) }

  scope :waranty, -> {find_by(property: Property.waranty)}

  scope :screen_size, -> {find_by(property: Property.screen_size)}
  scope :screen_resolution, -> {find_by(property: Property.screen_resolution)}
  scope :processor, -> {find_by(property: Property.processor)}
  scope :ram_size, -> {find_by(property: Property.ram_size)}
  scope :ram_type, -> { find_by(property: Property.ram_type) }
  scope :hdd_size, -> { find_by(property: Property.hdd_size) }
  scope :ssd_size, -> { find_by(property: Property.ssd_size) }
  scope :video_chiset, -> { find_by(property: Property.video_chiset) }
  scope :video_ram_size, -> { find_by(property: Property.video_ram_size) }
end
