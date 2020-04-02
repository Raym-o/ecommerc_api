# frozen_string_literal: true

# Class representing Collections, sets of products with common traits
class Collection < ApplicationRecord
  has_many :collection_products
  has_many :products, through: :collection_products
  accepts_nested_attributes_for :collection_products, allow_destroy: true

  validates :title, presence: true
  validates :title, length: { maximum: 50 }

  validates :title, :description, format: { with: /\A[a-zA-Z0-9 -,.:;]+\z/ }

  validates :description, length: { maximum: 500 }

  has_one_attached :image
end
