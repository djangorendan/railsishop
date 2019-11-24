class CreateProductProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :product_properties do |t|
      t.references :product, foreign_key: true
      t.references :property, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
