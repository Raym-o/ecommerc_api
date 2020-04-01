# frozen_string_literal: true

json.extract! collection, :id, :title, :description, :slug, :created_at, :updated_at
json.url collection_url(collection, format: :json)

# json.products(collection.products) do |col_pro|
#   json.id col_pro.id
#   json.title col_pro.title
#   json.url product_url(col_pro, format: :json)
# end
