Musikpage::Application.routes.draw do
  
  resources :tracks


  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
 


  resources :sessions


  resources :albums do
    resources :genres
    resources :tracks
    resources :album_steps
end 
	resources :artists


    resources :genres
  resources :users
  root to: 'albums#index'
end
