Rails.application.routes.draw do
  devise_for :users

  resources :users, only: :update, defaults: { format: 'json' }
  resources :users, only: [:show, :edit] do
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
  resources :shelves, only: [:create, :destroy, :update], defaults: { format: 'json' }
  root 'devise/sessions#new'
  delete '/users/book_review/:id', to: 'book_reviews#destroy'
end
