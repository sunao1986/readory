Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  resources :books do
    resources :reviews
  end
  root 'books#index'
end
