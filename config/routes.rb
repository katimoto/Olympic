Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: 'articles#news'
  resources :users, only: [:index, :edit, :update, :show] do
    get 'article', on: :member
    get 'question', on: :member
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  resources :articles do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:show, :create, :destroy]
    collection do
      get 'search'
      get 'tagsearch'
      get 'searches'
    end
  end
  resources :questions do
    resource :likes, only: [:create, :destroy]
    resources :answers, only: [:create, :destroy] do
      resources :reactions, only: [:index, :new, :create, :destroy, :update]
    end
    collection do
      get 'search'
    end
  end
  resources :rooms, only: [:index, :new, :create, :destroy, :show] do
    collection do
      get 'search'
    end
    post 'order', on: :member
    get 'order_new', on: :member
    get 'order_edit', on: :member
    post 'order_update', on: :member
    resources :messages, only: [:index, :create]
  end
  resources :cards, only: [:new, :create, :show]
end
