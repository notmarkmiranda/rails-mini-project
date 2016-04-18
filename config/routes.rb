Rails.application.routes.draw do

  root to: "users#static"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, only: [:new, :create, :show]
  # resources :ideas, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :categories do
    resources :ideas, only: [:new, :create, :show]
  end
end
