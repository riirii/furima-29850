Rails.application.routes.draw do
  
  root to: "items#index"
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  } 

    
    resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
      resources :cards, only: [:index, :create]
    end
   

end
