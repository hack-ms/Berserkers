Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get '/matches', controller: :application, action: :matches

  root to: "users#show"

  devise_for :users, controllers: {
       sessions: 'users/sessions',
       registrations: 'users/registrations'
     }

  resources :users, only: [:show] do
    resources :promo_codes, only: [:index, :show]
    resources :favorites, only: :index
  end

  resources :promo_codes, only: [] do
    resources :exchanges, only: [:create]
  end

  resources :works, only: [:index, :show] do
    resources :complaints, only: [:new, :create, :edit, :update]
    resources :favorites, only: [:create, :destroy]
  end
end
