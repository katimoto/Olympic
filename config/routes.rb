Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get 'messages/index'
  root to: 'articles#index'
  # root to: "rooms#index"
  resources :users, only: [:index, :edit, :update, :show] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :articles do
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
      get 'tagsearch'
    end
  end
  resources :questions do
  resources :answers, only: :create
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
  resources :cards, only: [:new, :create]
end
