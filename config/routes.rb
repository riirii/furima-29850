Rails.application.routes.draw do
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
    # :sessions => 'users/sessions'   
  }   
  root to: "items#index"

  #resources :users, only: [:new, :create]



end
