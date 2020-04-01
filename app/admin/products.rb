# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :title, :description, :price, :video, :slug, :image

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
