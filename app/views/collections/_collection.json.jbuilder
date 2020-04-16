# frozen_string_literal: true

json.extract! collection, :id, :title, :description, :slug, :created_at, :updated_at
json.url collection_url(collection, format: :json)

json.image_url url_for(collection.image) if collection.image.present?

json.products(collection.products) do |col_pro|
  json.id col_pro.id
  json.title col_pro.title
  json.description col_pro.description
  json.price col_pro.price
  json.created_at col_pro.created_at
  json.updated_at col_pro.updated_at
  json.image_url url_for(col_pro.image) if col_pro.image.present?
  json.url product_url(col_pro, format: :json)
end
#:id, :title, :description, :price, :video, :slug, :created_at, :updated_at
