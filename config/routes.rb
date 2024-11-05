Rails.application.routes.draw do
  root "home#index"
  resources :authors
  resources :users
  resources :books
  resources :rentals
end
