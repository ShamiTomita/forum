Rails.application.routes.draw do
  root 'forums#index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/logout' => 'session#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  resources :sessions
  resources :messages
  resources :posts
  resources :forums do
    resources :posts
  end

  resources :users do
    resources :posts, :forums
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
