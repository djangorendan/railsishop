class AddRowsToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :slug, :string
    add_index :products, :slug, unique: true
    add_column :products, :summary, :string
    add_column :products, :discription, :text
    add_column :products, :price, :integer
    add_column :products, :quantity, :integer
    add_column :products, :display, :boolean
  end
end
