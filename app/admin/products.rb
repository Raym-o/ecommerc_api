# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params :title, :description, :price, :image, :video, :slug
end
