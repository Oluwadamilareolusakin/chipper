Rails.application.routes.draw do
  get 'timelines/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#landing_page'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
  
  resources :administrators

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
