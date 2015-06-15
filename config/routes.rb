Rails.application.routes.draw do
  root to: 'users#index'

  namespace :admin do
    resources :users, :categories
  end

  resources :users, only: [:index, :new, :create, :show]
  resources :ideas

  resources :images, only: [:index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
