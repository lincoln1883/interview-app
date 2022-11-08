# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products, only: [:index, :show]

  get "api/stock_and_pricing"
end
