json.extract! order, :id, :status, :price, :pst, :gst, :hst, :customer_id, :created_at, :updated_at
json.url order_url(order, format: :json)
