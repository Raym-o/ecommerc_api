# frozen_string_literal: true

json.extract! collection, :id, :title, :description, :slug, :created_at, :updated_at
json.url collection_url(collection, format: :json)

json.products(collection.collection_products).present? do |col_pro|
  json.id col_pro.product.id
  json.title col_pro.product.title
  json.url product_url(col_pro.product, format: :json)
end
