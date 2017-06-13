Rails.application.routes.draw do
  get 'favorites/create'

  get 'favorites/destroy'

  get 'users/index'

  get 'users/show'

  devise_for :users
    resources :users, only: [:index, :show] do
      get :favorites, on: :member
    end
    resources :posts do
      resource :favorites
    end
    
    resources :users, only: [:show] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
    end

    resources :favorites, only: :index
  root 'home#top'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
