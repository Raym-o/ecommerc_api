# frozen_string_literal: true

json.extract! address, :id, :line_1, :line_2, :city, :postal_code, :province_id, :customer_id, :created_at, :updated_at
json.url address_url(address, format: :json)
