class AddMainPropertyToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :main_property, :boolean
  end
end
