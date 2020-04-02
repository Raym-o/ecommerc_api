# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :title, :description, :price,
                :video, :slug,
                collection_products_attributes: %i[id collection_id product_id _destroy]

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Product' do
      f.input :title
      f.input :description
      f.input :price
      f.input :video
      f.input :slug
      f.input :image, as: :file
      f.has_many :collection_products, allow_destroy: true do |n_f|
        n_f.input :collection
      end
    end
    f.actions
  end
end
