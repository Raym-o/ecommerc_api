# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :order_products
  has_many :collection_products
  has_many :collections, through: :collection_products
  accepts_nested_attributes_for :collection_products, allow_destroy: true

  validates :title, :description, :price, presence: true
  validates :title, uniqueness: true

  has_one_attached :image

  # def on_sale?
  #   discount != 0
  # end

  # def sale_price
  #   on_sale? ? (price - price * discount).round(2) : price
  # end
end
