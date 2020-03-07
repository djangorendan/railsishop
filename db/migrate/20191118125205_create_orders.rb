class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :cart, foreign_key: true
      t.references :user, foreign_key: true
      t.string :payment
      t.string :status
      t.text :discription
      t.string :phone
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :departament
      t.string :delivery

      t.timestamps
    end
  end
end
