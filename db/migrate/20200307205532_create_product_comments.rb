class CreateProductComments < ActiveRecord::Migration[5.2]
  def change
    create_table :product_comments do |t|
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.boolean :display
      t.text :comment
      t.integer :like

      t.timestamps
    end
  end
end
