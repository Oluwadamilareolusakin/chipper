Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :administrators
  resources :users
  root to: 'administrators#new'

  resources :administrator_sessions, only: [:new, :create, :destroy]
  get 'login' => 'administrator_sessions#new'
  get 'logout' => 'administrator_sessons#destroy'
end
