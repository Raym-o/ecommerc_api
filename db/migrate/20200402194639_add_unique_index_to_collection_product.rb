# frozen_string_literal: true

class AddUniqueIndexToCollectionProduct < ActiveRecord::Migration[6.0]
  def change
    add_index(:collection_products, %i[collection_id product_id], unique: true)
  end
end
