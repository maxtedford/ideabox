Rails.application.routes.draw do
  root to: 'users#index'

  namespace :admin do
    resources :users, :categories
  end

  resources :users, only: [:index, :new, :create, :show]

  resources :images, only: [:index]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
