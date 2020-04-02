# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :province
  belongs_to :customer

  validates :line_1, :city, :postal_code, :province_id, :customer_id, presence: true

  validates :postal_code, format: {
    with: /[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ ]?\d[ABCEGHJ-NPRSTV-Z]\d/,
    message: 'must be a valid Canadian postal code'
  }

  # def line_3
  #   "#{city}, #{province.name} #{postal_code}"
  # end
end
