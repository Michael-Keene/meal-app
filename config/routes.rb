Rails.application.routes.draw do
  get 'search_entry/index'
  resources :shopping_lists
  resources :food_consumption_events
  resources :meal_consumption_events
  devise_for :users
  resources :meals do
    resources :ingredients
  end
  resources :foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "daily_log#index"
end
