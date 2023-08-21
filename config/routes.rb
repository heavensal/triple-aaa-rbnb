Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :celebrities do
    resources :bookings
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :celebrities do
    resources :bookings, only: [:index, :create, :update, :edit]
  end
  resources :bookings, only: :destroy
  # Defines the root path route ("/")
  # root "articles#index"
end
