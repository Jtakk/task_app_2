Rails.application.routes.draw do
  
  root 'rooms#home'
  get '/home', to: 'rooms#home'
  
  get '/signup', to: 'users#new'
  resources :users, except: [:index, :show] do
    member do
      get 'account'
      get 'profile'
    end
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
