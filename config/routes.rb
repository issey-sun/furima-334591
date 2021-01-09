Rails.application.routes.draw do
  devise_for :users
  get 'items', to: 'items#index'
  root "items#index"
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
end

# :destroy