Rails.application.routes.draw do
  namespace :api do
    post "/barber-login", to: "auth#login_barber"
    get "/barber-signup", to: "barber#create"
    post "/customer-login", to: "auth#login_customer"
    post "/customer-signup", to: "customers#create"
    delete "/logout", to: "customers#destroy"
    
    resources :products, only: [:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
