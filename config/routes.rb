Rails.application.routes.draw do
  root to: 'users#index'

  namespace :admin do
    resources :users
  end

  resources :users, only: [:index, :new, :create, :show]
  resources :ideas, only: [:new, :create, :show]

  resources :categories, only: [:index]

  resources :images, only: [:index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
