class CategoryProperty < ApplicationRecord
  belongs_to :category
  belongs_to :property
end
