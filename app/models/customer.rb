# frozen_string_literal: true

class Customer < ApplicationRecord
  has_one  :address, dependent: :destroy
  has_one  :province, through: :address
  has_many :orders, dependent: :restrict_with_error

  validates :first_name, :last_name, :username, :email, presence: true
  validates :username, uniqueness: { message: 'already in use' }
  validates :username, format: {
    with: /\A[a-zA-Z0-9]+\Z/,
    message: 'must be alphanumeric'
  }
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
    message: 'must be a valid email address'
  }
  validates :username, length: { minimum: 3 }
  # validates :password, length: { in: 8..128 }, confirmation: true
  # scope :with_orders, -> { joins(:orders).distinct }

  def full_name
    "#{first_name} #{last_name}"
  end
end
