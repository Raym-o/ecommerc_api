# frozen_string_literal: true

class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :price, :order, :product, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # This should likely be added, with a new column in table as "quantity"
  # validates :product, uniqueness: { scope: :collection }
end
