Rails.application.routes.draw do
  
  root 'rooms#home'
  get '/home', to: 'rooms#home'
  get '/signup', to: 'users#new'
  resources :users
  
end
