# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'products#index'

  get 'products/search', to: 'products#search', as: :search_products
  resources :products, only: %w[new create destroy]
end
