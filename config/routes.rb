Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/auth/facebook/callback', to: 'sessions#create'
  root to: "sessions#index"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  resources :users, only: [:new, :create, :show] do
    resources :achievements, only: [:index, :show]
  end
  resources :achievements, only: [:new, :create, :edit, :destroy]
  resources :goals, only: [:new, :create, :show, :index]
end
