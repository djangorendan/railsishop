class AddDiscriptionToProperty < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :discription, :string
  end
end
