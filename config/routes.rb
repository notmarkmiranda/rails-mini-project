Rails.application.routes.draw do

  root to: "users#static"

  resources :users, only: [:new, :create, :show]
end
