Rails.application.routes.draw do
 devise_for :users, controllers: {
   omniauth_callbacks: 'users/omniauth_callbacks',
   registrations: 'users/registrations'
 }
  get 'messages/index'
  root to: 'articles#index'
  # root to: "rooms#index"
  resources :users, only: [:edit, :update, :show]
  resources :articles do
    resources :favorites, only: :create
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
end
