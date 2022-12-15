Rails.application.routes.draw do
  devise_for :customers do
    get "/customers/sign_up" => "devise/registrations#new", :as => :new_customer_registration_path
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :categories
  resources :orders
  resources :products do
    collection do
      get "search"
    end
  end
  resources :cart, only: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  get "/contact", to: "contact#index", as: "contact" # contact_path
  get "/about", to: "about#index", as: "about" # about_path

  get "/shopping_cart", to: "cart#index", as: "shopping_cart" # cart_path

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end
end
