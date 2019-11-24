class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :ancestry

      t.timestamps
    end
    add_index :properties, :ancestry
  end
end
