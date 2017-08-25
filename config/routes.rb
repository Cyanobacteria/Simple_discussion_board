Rails.application.routes.draw do
  devise_for :users 

  resources :groups do
    member do
      post :join
      post :quit
     # get :show_by_user
    end 
  end


  get '/mygroups', to: 'groups#show_by_user', as: 'mygroups'

             
  resources :profiles, :except => [:new, :create, :destroy] do
    member do
      
    end
  end
  
  resources :posts, :except => [:index] do
    resources :discussions, :except => [:index, :new, :show ]
  end
  root 'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
