Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  # root to: 'orders#index'
  resources :items do
    resources :orders, only:[:index, :new, :create]
  end
end

