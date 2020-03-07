class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :ancestry
      t.integer :position
      t.boolean :display_filter
      t.boolean :display_product

      t.timestamps
    end
    add_index :properties, :ancestry
  end
end
