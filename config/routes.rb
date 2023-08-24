Rails.application.routes.draw do
  devise_for :users
  root to: "celebrities#index"
  get "dashboard", to: "pages#dashboard"
  get "dashboard/reviews", to: "pages#reviews"
  get "dashboard/celebrities", to: "pages#celebrities"
  get "dashboard/bookings", to: "pages#bookings"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :celebrities do
    resources :bookings, only: [:index, :create]
    resources :reviews, only: [:index, :create, :new]
  end
  resources :bookings, only: [:destroy, :update, :edit]
  resources :reviews, only: [:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
