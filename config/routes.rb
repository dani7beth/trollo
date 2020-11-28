Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "boards#index"

  resources :boards do
    resources :lists, only: [:index, :new, :create, :destroy, :edit, :update]
  end
end
