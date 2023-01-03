json.extract! order, :id, :user_id, :cart_id, :product_id, :price, :decimal, :quantity, :first_name, :last_name, :email, :phone, :country, :address, :town, :district, :postal_code, :description, :address_id, :created_at, :updated_at
json.url order_url(order, format: :json)
