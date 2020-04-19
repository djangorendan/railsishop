class AppImage < ApplicationRecord
  mount_uploader :image, ImageUploader

  scope :logo, -> { find_by(name: "Логотип") }
  scope :favicon, -> { find_by(name: "фавикон") }
end
