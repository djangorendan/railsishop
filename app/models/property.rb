class Property < ApplicationRecord
  has_many :category_properties, dependent: :destroy
  has_many :categories, through: :category_properties

  has_many :product_properties, dependent: :destroy

  scope :filter_displayed, -> { where.not(display_filter: false) }

  scope :manufacturer, -> { find_by(name: "Производитель") }
  scope :product_type, -> { find_by(name: "Тип") }
  scope :processor, -> { find_by(name: "Процессор") }
  scope :ram_size, -> { find_by(name: "Объем оперативной памяти") }
  scope :ram_type, -> { find_by(name: "Тип оперативной памяти") }
  scope :hdd_size, -> { find_by(name: "Объем HDD") }
  scope :ssd_size, -> { find_by(name: "Объем SSD") }
  scope :video_chiset, -> { find_by(name: "Графический контроллер") }

  has_ancestry
end
