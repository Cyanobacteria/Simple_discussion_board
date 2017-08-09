Rails.application.routes.draw do
  devise_for :users 
  resources :groups do
    member do
      post :join
      post :quit
    end 
  end
                    
  resources :profiles, :except => [:index, :new, :create, :destroy]
  
  resources :posts, :except => [:index] do
    resources :discussions, :except => [:index, :new ]
  end
  root 'groups#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
