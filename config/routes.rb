Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :photos do
    resources :comments
  end
  get 'home/index'
end
