# frozen_string_literal: true

json.extract! product, :id, :title, :description, :price, :video, :slug, :created_at, :updated_at
json.url product_url(product, format: :json)

json.image_url url_for(product.image) if product.image.present?

json.collections(product.collections) do |collection|
  json.id collection.id
  json.title collection.title
  json.url collection_url(collection, format: :json)
end
