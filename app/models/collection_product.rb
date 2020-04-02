# frozen_string_literal: true

class CollectionProduct < ApplicationRecord
  belongs_to :collection
  belongs_to :product
end
