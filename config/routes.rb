Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show] do
    collection do
      get :feeds
    end
    
    member do
      get :dashboard
      post :favorite
      post :unfavorite
    end

    resources :comments, only:[:create, :destroy]
  end
  resources :categories, only: :show
  resources :users, only: [:show, :edit, :update]
  root "restaurants#index"

  namespace :admin do 
  	resources :restaurants
    resources :categories
  	root "restaurants#index"

  end
end
