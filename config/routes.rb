Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :photos
  get 'home/index'
end
