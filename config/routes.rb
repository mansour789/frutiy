Rails.application.routes.draw do
  resources :orders
  devise_for :users
  resources :products

 
  get '/home/', to: "static#home"
  get '/about/', to: "static#about"
  get '/contact/', to: "static#contact"

  get "/products/:product_id/orders/create", to: "orders#create"
  
  root 'static#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
