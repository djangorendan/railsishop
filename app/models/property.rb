class Property < ApplicationRecord
  has_many :category_properties, dependent: :destroy
  has_many :categories, through: :category_properties

  has_many :product_properties, dependent: :destroy

  scope :filter_displayed, -> { where.not(display_filter: false) }

  has_ancestry
end
