# frozen_string_literal: true
Rails.application.routes.draw do
  post 'search_entries/index'
  resources :shopping_lists
  resources :food_consumption_events, except: :show
  resources :meal_consumption_events, except: :show
  devise_for :users
  resources :meals do
    resources :ingredients
  end
  resources :foods
  get 'user_targets', to: 'user_targets#show', as: :user_targets
  patch 'user_targets', to: 'user_targets#update'
  get 'user_targets/edit', to: 'user_targets#edit', as: :edit_user_targets
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'daily_log#index', as: :daily_log
end
