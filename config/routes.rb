Rails.application.routes.draw do

  devise_for :users
  resources :users, only: :show do
    collection do 
      get 'search'
    end
  end
  resources :books do
    resources :reviews
      collection do 
        get 'search'
      end
  end
  # root 'books#index'
  root 'books#search'
end
