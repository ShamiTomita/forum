Rails.application.routes.draw do
  root 'static#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  resources :sessions
  resources :messages
  resources :posts
  resources :forums
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
