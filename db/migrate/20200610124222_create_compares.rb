class CreateCompares < ActiveRecord::Migration[5.2]
  def change
    create_table :compares do |t|

      t.timestamps
    end
  end
end
