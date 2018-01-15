Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'chat/index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :messages

  resources :users

  root 'chat#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
