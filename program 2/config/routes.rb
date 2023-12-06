#Rails.application.routes.draw do
#  get 'home/index'
#  get 'sessions/new'
#  get 'sessions/create'
#  get 'sessions/destroy'
#  resources :reviews
#  resources :passengers
#  resources :tickets
#  resources :trains
#  resources :admins
#  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#
#  # Defines the root path route ("/")
#  root "home#index"
#end

Rails.application.routes.draw do
  root 'home#index'
  
  resources :passengers
  resources :trains
  resources :admins
  resources :tickets
  resources :reviews
  resources :sessions, only: [:new, :create, :destroy]  
  
  get 'signup', to: 'passengers#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # config/routes.rb
  get '/trains/departing/:station_name', to: 'trains#list_by_station', as: 'trains_departing'
  get '/trains/terminating/:station_name', to: 'trains#list_by_station', as: 'trains_terminating'
  get '/trains/upcoming/:departure_time', to: 'trains#get_upcoming_available_trains', as: 'trains_upcoming'
  get '/trains/previous/:departure_time', to: 'trains#get_previous_available_trains', as: 'trains_previous'

  get '/reviews/user/:user', to: 'reviews#list_by_user', as: 'user_reviews'
  get '/reviews/train/:train', to: 'reviews#list_by_train', as: 'train_reviews'

  get 'train_search', to: 'trains#search', as: 'train_search'

end
