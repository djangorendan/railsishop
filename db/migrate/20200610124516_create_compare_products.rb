class CreateCompareProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :compare_products do |t|
      t.references :product, foreign_key: true
      t.references :compare, foreign_key: true

      t.timestamps
    end
  end
end
