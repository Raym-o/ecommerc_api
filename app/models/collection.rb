# frozen_string_literal: true

class Collection < ApplicationRecord
  has_many :collection_products
  has_many :products, through: :collection_products
  accepts_nested_attributes_for :collection_products, allow_destroy: true

  validates :title, presence: true

  has_one_attached :image
end
