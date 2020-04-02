# frozen_string_literal: true

class CollectionProduct < ApplicationRecord
  belongs_to :collection
  belongs_to :product

  validates :product_id, uniqueness: { scope: :collection_id }
  validates :collection_id, uniqueness: { scope: :product_id }
end
