Rails.application.routes.draw do
  devise_for :users
  get 'items', to: 'items#index'
  root "items#index"
  resources :items, only: [:index]
end

# devise_for :users
#   get 'prototypes/index'
#   root to: "prototypes#index"
#   resources :prototypes, only: [:new, :create, :index, :show, :edit, :update, :destroy,] do
#     resources :comments, only: :create
#   end

#   resources :users, only: :show
  
# end