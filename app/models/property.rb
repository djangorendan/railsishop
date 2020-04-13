class Property < ApplicationRecord
  has_many :category_properties, dependent: :destroy
  has_many :categories, through: :category_properties

  has_many :product_properties, dependent: :destroy

  scope :filter_displayed, -> { where.not(display_filter: false) }

  scope :manufacturer, -> { find_by(name: "Производитель") }
  scope :product_type, -> { find_by(name: "Тип") }
  scope :model_processor, -> { find_by(name: "Модель процессора") }
  scope :ram_size, -> { find_by(name: "Объем оперативной памяти") }
  scope :ram_type, -> { find_by(name: "Тип оперативной памяти") }
  scope :rom_size, -> { find_by(name: "Объем дискового накопителя") }
  scope :rom_type, -> { find_by(name: "Тип дискового накопителя") }
  scope :video_chiset, -> { find_by(name: "Графический чипсет") }

  has_ancestry
end
