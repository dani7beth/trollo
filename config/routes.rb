Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "boards#index"
  
  resources :boards do
    member do
      get :move_up
    end
  end

  resources :boards do
    resources :lists do
    end
  end
  resources :lists do
    resources :tasks
  end
end
