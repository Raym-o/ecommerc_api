# frozen_string_literal: true

json.extract! customer, :id, :first_name, :last_name, :password_digest, :username, :email, :created_at, :updated_at
json.url customer_url(customer, format: :json)

json.address do
  json.id customer.address.id
  json.line_1 customer.address.line_1
  json.line_2 customer.address.line_2
  json.city customer.address.city
  json.postal_code customer.address.postal_code
  json.province_id customer.address.province_id
end
