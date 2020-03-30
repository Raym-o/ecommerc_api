# frozen_string_literal: true

class Collection < ApplicationRecord
  has_many :collection_products
  has_many :products, through: :collection_products

  validates :title, presence: true
end
