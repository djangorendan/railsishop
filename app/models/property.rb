class Property < ApplicationRecord

  has_many :category_properties, dependent: :destroy
  has_many :categories, through: :category_properties

  has_many :product_properties, dependent: :destroy

  scope :filter_displayed, -> { where.not(display_filter: false) }

  scope :product_type, -> { find_by(name: "Тип") }

  scope :waranty, -> {find_by(name: "Гарантия (от магазина)")}

  scope :main_properties, -> {where(main_property: true)}

  scope :screen_size, -> {find_by(name: "Диагональ экрана")}
  scope :screen_resolution, -> {find_by(name: "Разрешение экрана")}
  scope :processor, -> { find_by(name: "Процессор") }
  scope :ram_size, -> { find_by(name: "Объем оперативной памяти") }
  scope :ram_type, -> { find_by(name: "Тип оперативной памяти") }
  scope :hdd_size, -> { find_by(name: "Объем HDD") }
  scope :ssd_size, -> { find_by(name: "Объем SSD") }
  scope :video_chiset, -> { find_by(name: "Графический контроллер") }
  scope :video_ram_size, -> { find_by(name: "Объем видеопамяти") }

  has_ancestry
end
