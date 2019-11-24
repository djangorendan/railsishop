class AddTotalProductsSumInCartProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_products, :total_product_sum, :integer
  end
end
