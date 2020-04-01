# frozen_string_literal: true

ActiveAdmin.register Collection do
  permit_params :title, :description, :slug, :image

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
