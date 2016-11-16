Rails.application.routes.draw do
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  get '/users/:id', to: 'users#show'

  post '/users', to: 'users#create'
end
