Rails.application.routes.draw do
  root to: 'users#index'
  
  resources :users, only: [:index, :new, :create, :show]

  namespace :admin do
    resources :users
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
