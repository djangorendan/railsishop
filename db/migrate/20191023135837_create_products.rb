class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.string :summary
      t.integer :price
      t.integer :quantity
      t.boolean :display
      t.text :discription
      t.integer :views
      t.integer :index
      t.references :category, foreign_key: true
      
      t.timestamps
    end
    add_index :products, :slug, unique: true
    add_index :products, :index, unique: true
  end
end
