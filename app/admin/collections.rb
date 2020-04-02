# frozen_string_literal: true

ActiveAdmin.register Collection do
  permit_params :title, :description, :slug,
                collection_products_attributes: %i[id collection_id product_id _destroy]

  index do
    selectable_column
    column :id
    column :title
    column :description
    column :slug
    column :products do |collection|
      collection.products.map(&:title).join(', ').html_safe
    end
    actions
  end

  show do |_collection|
    attributes_table do
      row :title
      row :description
      row :slug
      row :products do |collection|
        collection.products.map(&:title).join(', ').html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs 'Product' do
      f.input :title
      f.input :description
      f.input :slug
      f.has_many :collection_products, allow_destroy: true do |n_f|
        n_f.input :product
      end
    end
    f.actions
  end
end
