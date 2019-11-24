class AddTotalCartSumToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :total_cart_sum, :integer, :default => 0
  end
end
