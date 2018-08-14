Rails.application.routes.draw do
  get 'messages/index'
  get 'conversations/index'
  devise_for :users
  root to: 'boards#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :boards do
    resources :bookings, only: [:index, :show, :new, :create, :destroy]
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

end
