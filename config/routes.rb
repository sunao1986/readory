Rails.application.routes.draw do

  devise_for :users
  resources :users, only: :show do
    collection do 
      get 'search'
    end
    # resources :book_reviews do
      # collection do 
        # get 'search'
      # end
    # end
  end
  resources :book_reviews, only: [:index, :create, :update] do
      collection do 
        get 'search'
      end
  end
  root 'book_reviews#index'
  # root 'book_reviews#search'
end
