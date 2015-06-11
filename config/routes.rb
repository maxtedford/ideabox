Rails.application.routes.draw do
 resources :users, only: [:index, :new, :create, :show]

  get '/login', to: 'sessions#new'

end
