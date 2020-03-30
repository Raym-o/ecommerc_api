# frozen_string_literal: true

class Province < ApplicationRecord
  has_many :addresses, dependent: :restrict_with_error
  has_many :customers, through: :addresses

  validates :name, :abbr, presence: true, uniqueness: true
  validates :abbr, length: { minimum: 2, maximum: 2 }
end
