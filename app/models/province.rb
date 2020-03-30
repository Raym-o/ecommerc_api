# frozen_string_literal: true

class Province < ApplicationRecord
  has_many :addresses, dependent: :restrict_with_error
  has_many :customers, through: :addresses

  validates :name, presence: true, uniqueness: true
end
