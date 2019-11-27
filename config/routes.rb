Rails.application.routes.draw do
  devise_for :users

  resources :users, only: :show do
    collection do 
      get 'search'
    end
  end

  resources :book_reviews, only: [:index, :create, :update, :show] do
    resources :likes, only: [:create, :destroy]
      collection do 
        get 'search'
      end
  end

  root 'book_reviews#index'
  # root 'book_reviews#search'
end
