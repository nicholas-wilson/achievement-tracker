Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/auth/facebook/callback', to: 'sessions#create'
  get '/', to: "sessions#index"
end
