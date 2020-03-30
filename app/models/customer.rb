# frozen_string_literal: true

class Customer < ApplicationRecord
  has_one :address
  has_one :province, through: :address
  has_many :orders
end
