# frozen_string_literal: true

# Class that represents Products offered for sale.
class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :collection_products
  has_many :collections, through: :collection_products
  accepts_nested_attributes_for :collection_products, allow_destroy: true

  validates :title, :price, presence: true

  validates :title, uniqueness: true
  validates :title, length: { maximum: 50 }

  validates :title, format: { with: /\A[a-zA-Z0-9 \-,.:;]+\z/ }
  validates :description, format: { with: /\A[a-zA-Z0-9 \-,.:;]+\z/ }, if: -> { description.present? }

  validates :description, length: { maximum: 500 }

  validates :price, numericality: { greater_than_or_equal_to: 0 }

  has_one_attached :image

  # def on_sale?
  #   discount != 0
  # end

  # def sale_price
  #   on_sale? ? (price - price * discount).round(2) : price
  # end
end
