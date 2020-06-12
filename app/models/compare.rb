class Compare < ApplicationRecord
  has_many :compare_products, dependent: :destroy
  has_many :products, through: :compare_products
end
