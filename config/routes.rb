Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#landing_page'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :posts 
  get '/chip', to: 'posts#new'
  post '/chip', to: 'posts#create'
  delete '/unchip', to: 'posts#destroy'

  get '/timeline', to: 'static_pages#timeline'

  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]

  resources :password_reset, only: [:edit, :update]

  get '/reset', to: 'password_reset#new'
  post '/reset', to: 'password_reset#create'
end
