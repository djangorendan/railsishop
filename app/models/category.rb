class Category < ApplicationRecord
  has_many :category_properties, dependent: :destroy
  has_many :properties, through: :category_properties

  has_many :products, dependent: :destroy
  has_many :product_properties, through: :products
  
  has_ancestry

  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :image, ImageUploader
end
