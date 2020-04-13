class AddDiscriptionToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :discription, :string
  end
end
