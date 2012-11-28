Sala::Application.routes.draw do
  get "home/index"
  match 'user/edit' => 'users#edit', :as => :edit_current_user
  match 'user/search' => 'users#search', :as => :search_current_user
  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login

  match 'reservations/validate' => 'reservations#validate', :as => :validate_reservation

  root :to => "home#index"

  resources :sessions
  resources :users

end
