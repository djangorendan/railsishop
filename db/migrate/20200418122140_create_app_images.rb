class CreateAppImages < ActiveRecord::Migration[5.2]
  def change
    create_table :app_images do |t|
      t.string :name
      t.string :image

      t.timestamps
    end
  end
end
