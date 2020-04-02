# frozen_string_literal: true

json.extract! order, :id, :status, :price, :pst, :gst, :hst, :customer_id, :created_at, :updated_at
json.url order_url(order, format: :json)

json.products(order.products) do |ord_pro|
  json.id ord_pro.id
  json.title ord_pro.title
  json.url product_url(ord_pro, format: :json)
end
