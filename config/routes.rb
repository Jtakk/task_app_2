Rails.application.routes.draw do
  
  root 'rooms#home'
  get '/home', to: 'rooms#home'
  resources :rooms
  
  get '/signup', to: 'users#new'
  resources :users, except: [:index, :show] do
    member do
      get 'account'
      get 'profile'
      get 'posts'
    end
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :reservations, only: [:index, :new, :create, :destroy]
  
  
end
