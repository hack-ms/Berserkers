Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "works#index"

  devise_for :users
  resources :works, only: [:index, :show]
  resources :works, only: [] do
    resources :complaints, only: [:new, :create]
    resources :favorites, only: [:create]
  end
end
