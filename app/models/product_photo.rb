class ProductPhoto < ApplicationRecord
  belongs_to :product

  mount_uploader :image, ImageUploader

  scope :main, -> { where.not(main: false) }
  scope :not_main, -> { where.not(main: true) }
end
