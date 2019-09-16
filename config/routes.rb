Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#landing_page'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :posts 
  get '/chip', to: 'posts#new'
  post '/chip', to: 'posts#create'
  delete '/unchip', to: 'posts#destroy'

  get '/timeline', to: 'timelines#show'

  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :administrators
end
