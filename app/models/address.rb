# frozen_string_literal: true

# Class that represents Address of Customer with account set up with Website.
class Address < ApplicationRecord
  belongs_to :province
  belongs_to :customer

  validates :line_1, :city, :postal_code, :province, :customer, presence: true

  validates :city, format: { with: /\A[a-zA-Z0-9 -.]*\z/ }

  validates :line_1, :line_2, format: { with: /\A[a-zA-Z0-9 -,.:;]+\z/ }

  validates :postal_code, format: {
    with: /[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ ]?\d[ABCEGHJ-NPRSTV-Z]\d/,
    message: 'must be a valid Canadian postal code'
  }

  # def line_3
  #   "#{city}, #{province.name} #{postal_code}"
  # end
end
