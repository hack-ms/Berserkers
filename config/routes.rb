Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "works#index"

  devise_for :users

  resources :users, only: [:show] do 
    resources :promo_codes, only: [:index, :show]
  end

  resources :promo_codes, only: [] do
    resources :exchanges, only: [:create]
  end

  resources :works, only: [:index, :show] do
    resources :complaints, only: [:new, :create]
    resources :favorites, only: [:create, :destroy]
  end
end
