Rails.application.routes.draw do
  get '/users', to: 'users#index'
  get '/users/new', to: 'users#new'
  get '/users/:id', to: 'users#show'

  post '/users', to: 'users#create'
  delete '/users/:id/delete', to: 'users#destroy'

  get '/users/:user_id/products/new', to: 'products#new'

  post '/users/:user_id/products/', to: 'products#create',
 as: :user_products
end
