json.extract! product_photo, :id, :image, :main, :product_id, :created_at, :updated_at
json.url product_photo_url(product_photo, format: :json)
