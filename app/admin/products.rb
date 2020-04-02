# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :title, :description, :price,
                :video, :slug, :image,
                collection_products_attributes: %i[id collection_id product_id _destroy]

  index do
    selectable_column
    column :id
    column :title
    column :description
    column :price
    column :video
    column :slug
    column :image do |product|
      product.image.present?
    end
    column :collections do |product|
      product.collections.map(&:title).join(', ').html_safe
    end
    actions
  end

  show do |_collection|
    attributes_table do
      row :title
      row :description
      row :price
      row :video
      row :slug
      row :image
      row :collections do |product|
        product.collections.map(&:title).join(', ').html_safe
      end
    end
  end

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
