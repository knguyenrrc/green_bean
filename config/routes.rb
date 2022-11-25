Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories
  resources :orders
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  get "/contact", to: "contact#index", as: "contact" # contact_path
  get "/about", to: "about#index", as: "about" # about_path
end
