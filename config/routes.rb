Rails.application.routes.draw do
  get 'messages/index'
  root to: "messages#index"
end
