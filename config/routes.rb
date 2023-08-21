Rails.application.routes.draw do
  devise_for :users
  root to: "celebrities#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :celebrities do
    resources :bookings, only: [:index, :create]
  end
  resources :bookings, only: [:destroy, :update, :edit]
  # Defines the root path route ("/")
  # root "articles#index"
end
