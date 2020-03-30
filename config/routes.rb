Rails.application.routes.draw do
  resources :collections
  resources :order_products
  resources :orders
  resources :products
  resources :addresses
  resources :customers
  resources :provinces
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
