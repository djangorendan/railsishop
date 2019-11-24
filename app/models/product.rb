class Product < ApplicationRecord
  include PgSearch
  pg_search_scope :search_everywhere, against: [:name, :index, :summary, :discription]

  belongs_to :category

  has_many :product_properties, dependent: :destroy
  accepts_nested_attributes_for :product_properties, :allow_destroy => true

  has_many :cart_products, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploaders :attachments, ImageUploader

  paginates_per 9

  scope :displayed, -> { where.not(display: false) }

  scope :filter_by_category, -> (params) {
    return unless params
    where("
      products.price >= #{params[:price_down].present? ? params[:price_down] : '0'}
      #{params[:price_up].present? ? 'AND products.price <= ' + params[:price_up].to_s : ''}
    ").product_properties_filter(params[:product_properties]).order_product(params)
  }

  scope :product_properties_filter, -> (product_properties) {
    return if product_properties.length < 3

    product_properties = JSON.parse product_properties
    product_ids = []
    product_properties.each do |key, product_properties_by_category|

      product_ids_1 = ProductProperty.select('product_id').where(
        "name IN (#{product_properties_by_category.map{|pp| "'#{pp}'"}.join(',')})"
      ).group('name, product_id').map{|pp| pp.product_id}.sort()

      if product_ids.length > 0
        product_ids.map!{|pi| pi if product_ids_1.include?(pi)}
      else
        product_ids = product_ids_1
      end

    end
    where('id IN (?)', product_ids)
  }

  scope :order_product, -> (params) {
    order_by = params[:order_by] || 'views'
    order_to = params[:order_to] || 'asc'
    order("#{order_by} #{order_to}")
  }

end
