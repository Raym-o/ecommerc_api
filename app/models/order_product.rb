# frozen_string_literal: true

class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :price, :order, :product, :quantity, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }

  # This should likely be added, with a new column in table as "quantity"
  # validates :product, uniqueness: { scope: :collection }
end
