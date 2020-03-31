# frozen_string_literal: true

provinces = [
  { name: 'Alberta', abbr: 'AB', pst_rate: 0, hst_rate: 0 },
  { name: 'British Columbia', abbr: 'BC', pst_rate: 0.07, hst_rate: 0 },
  { name: 'Manitoba', abbr: 'MB', pst_rate: 0.07, hst_rate: 0 },
  { name: 'New Brunswick', abbr: 'NB', pst_rate: 0, hst_rate: 0.1 },
  { name: 'Newfoundland and Labrador', abbr: 'NL', pst_rate: 0, hst_rate: 0.1 },
  { name: 'Nova Scotia', abbr: 'NS', pst_rate: 0, hst_rate: 0.1 },
  { name: 'Northwest Territories', abbr: 'NT', pst_rate: 0, hst_rate: 0 },
  { name: 'Nunavut', abbr: 'NU', pst_rate: 0, hst_rate: 0 },
  { name: 'Ontario', abbr: 'ON', pst_rate: 0, hst_rate: 0.08 },
  { name: 'Prince Edward Island', abbr: 'PE', pst_rate: 0, hst_rate: 0.1 },
  { name: 'Quebec', abbr: 'QC', pst_rate: 0.09975, hst_rate: 0 },
  { name: 'Saskatchewan', abbr: 'SK', pst_rate: 0.06, hst_rate: 0 },
  { name: 'Yukon', abbr: 'YT', pst_rate: 0, hst_rate: 0 }
]

provinces.each do |province|
  prov = Province.create(
    name: province[:name],
    abbr: province[:abbr],
    pst_rate: province[:pst_rate],
    hst_rate: province[:hst_rate]
  )
end

10.times do
  product = Product.create(
    title: Faker::Food.unique.dish,
    description: Faker::Food.unique.description,
    price: Faker::Number.decimal(l_digits: 2, r_digits: 2)
  )
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?