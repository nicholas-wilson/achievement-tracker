Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/auth/facebook/callback', to: 'sessions#create'
  root to: "sessions#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  resources :users, only: [:new, :create, :show]
  resources :achievements
  resources :goals, only: [:new, :create, :show, :index]
end
