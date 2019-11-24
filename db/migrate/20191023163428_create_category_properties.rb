class CreateCategoryProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :category_properties do |t|
      t.references :category, foreign_key: true
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
