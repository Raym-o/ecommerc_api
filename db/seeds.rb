# frozen_string_literal: true

require 'uri'
require 'csv'

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

CSV.foreach(Rails.root.join('../csv/https___justthegoods.net_searc.csv'),
            encoding: 'iso-8859-1:utf-8',
            quote_char: '^',
            col_sep: '`', headers: true) do |row|
  product = Product.create(
    title: row[1],
    description: Faker::Food.description,
    price: row[4]
  )
  # file = URI.open(row[2].to_s)
  product.image.attach(io: URI.open(row[2]), filename: row[1], content_type: 'image/jpg')
end

col_counter = ''
CSV.foreach(Rails.root.join('../csv/https___justthegoods.net_colle.csv'),
            encoding: 'iso-8859-1:utf-8',
            quote_char: '^',
            col_sep: '`', headers: true) do |row|
  col = Collection.create(
    title: row[2],
    description: Faker::Game.genre + col_counter
  )
  img = row[1]
  img_url = 'https:' + img.slice(img.index("'") + 1, (img.rindex("'") - img.index("'") - 1))
  col.image.attach(io: URI.open(img_url), filename: row[2])
  col_counter += 'a'
  prod_x = 1
  3.times do
    CollectionProduct.create(
      collection_id: col.id,
      product_id: prod_x
    )
    prod_x += 1
  end
end

customers_array = [
  { first_name: 'joe', last_name: 'low', password_digest: 'aerhrhaejhsjt', username: 'lowjoe', email: 'abc@any.com', addr_count: 1 },
  { first_name: 'joe', last_name: 'slow', password_digest: 'aerhrhaejsegsegsehsjt', username: 'lowjsfasoe', email: 'abc1@any.com', addr_count: 2 },
  { first_name: 'joe', last_name: 'blow', password_digest: 'aerhrseffhaejhsjt', username: 'lowjoeeee', email: 'abc2@any.com', addr_count: 3 }
]

addr_count = 0
customers_array.each do |cust|
  cur = Customer.create(
    first_name: cust[:first_name],
    last_name: cust[:last_name],
    password_digest: cust[:password_digest],
    username: cust[:username],
    email: cust[:email]
  )
  addr_count += 1
  Address.create(
    customer_id: cur.id,
    line_1: "#{cust[:addr_count]} Any street",
    line_2: '',
    city: "#{cust[:addr_count]} City",
    postal_code: "T#{cust[:addr_count]}T#{cust[:addr_count]}P#{cust[:addr_count]}",
    province_id: 1
  )
  ct2 = 1
  3.times do
    ord = Order.create(
      status: 'Unpaid',
      price: 0.1,
      pst: 0.0,
      gst: 0.0,
      hst: 0.0,
      customer: cur
    )
    2.times do
      op = Product.find(ct2)
      OrderProduct.create(
        order_id: ord.id,
        product_id: op.id,
        price: 0.55
      )
      ct2 += 1
    end
  end
end

# emailcounter = 0
# email_array = ['first@test.com', 'second@teest.com', 'thrid@ggas.com']
# 3.times do
#   custy = Customer.create(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     password_digest: 'agarhgarhyahaerhaersh',
#     username: Faker::Name.unique.name,
#     email: email_array[emailcounter]
#   )
#   emailcounter += 1
# end

Page.create(title: 'About', content: 'Fill this in.', permalink: 'about_us')
Page.create(title: 'Contact', content: 'Fill this in.', permalink: 'contact_us')

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
