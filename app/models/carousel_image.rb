class CarouselImage < ApplicationRecord
  mount_uploader :image, ImageUploader
end
