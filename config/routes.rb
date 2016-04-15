Rails.application.routes.draw do

  root to: "users#static"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  resources :users, only: [:new, :create, :show]

end
