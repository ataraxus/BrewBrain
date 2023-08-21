Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root "home#index"
  get 'home/index'
  resources :batch_steps
  resources :resources
  resources :executed_steps
  resources :comments
  resources :batches
  resources :formula_ingredients
  resources :ingredients
  resources :formula_steps
  resources :formulas
  resources :formula_categories
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
