Rails.application.routes.draw do
  devise_for :users
  root to: 'boards#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :boards do
    resources :bookings, only: [:show, :new, :create, :destroy]
  end

  resources :bookings, only: [:index]
end
