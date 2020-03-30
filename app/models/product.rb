# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :order_products
  has_many :collection_products
  has_many :collections, through: :collection_products
end
