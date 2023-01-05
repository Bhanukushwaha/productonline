json.extract! review, :id, :rating, :comment, :user_id, :product_id, :order_id, :created_at, :updated_at
json.url review_url(review, format: :json)
