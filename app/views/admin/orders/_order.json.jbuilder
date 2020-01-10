json.extract! order, :id, :cart_id, :user_id, :payment, :status, :discription, :created_at, :updated_at
json.url order_url(order, format: :json)
