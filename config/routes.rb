# frozen_string_literal: true

Rails.application.routes.draw do
  resources :pages
  get '/p/:permalink', to: 'pages#permalink', as: 'permalink', except: :permalink
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  constraints ->(request) { request.format == :json } do
    resources :collections
    resources :orders
    resources :products
    resources :provinces
    resources :customers
    resources :addresses
    resources :collection_products
    resources :order_products
  end
end
