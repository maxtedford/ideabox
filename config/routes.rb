Rails.application.routes.draw do
 resources :users, only: [:index, :new, :create, :show]
 resources :ideas, only: [:new]

  get '/login', to: 'sessions#new'

end
