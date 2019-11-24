class Property < ApplicationRecord
  has_many :category_properties, dependent: :destroy
  has_many :categories, through: :category_properties

  has_many :product_properties, dependent: :destroy

  has_ancestry
end
