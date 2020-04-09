# frozen_string_literal: true

class CollectionProduct < ApplicationRecord
  belongs_to :collection
  belongs_to :product

  # Added both to provide meaningful error message for either Model in Admin add form
  validates :product, uniqueness: { scope: :collection }
end
