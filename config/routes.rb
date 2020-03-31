# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  constraints ->(request) { request.format == :json } do
    resources :collections
    resources :orders
    resources :products
    resources :customers
  end
end
