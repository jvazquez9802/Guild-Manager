Rails.application.routes.draw do
  root "home#index"
  resources :users, except: [:new]
  resources :forums
  resources :guides
  resources :activities
  resources :comments
  resources :sessions, only: [:new, :create, :destroy]

  get "sign_up", to: "users#new", as: :sign_up
  get "about", to: "pages#about", as: :about
  get "contact", to: "pages#contact", as: :contact
end
