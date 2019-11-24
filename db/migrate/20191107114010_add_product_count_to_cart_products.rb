class AddProductCountToCartProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_products, :product_count, :integer
  end
end
