# frozen_string_literal: true

ActiveAdmin.register Collection do
  permit_params :title, :description, :slug
end
