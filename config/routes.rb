Rails.application.routes.draw do
  resources :orders
  devise_for :users
  resources :products

 
  get '/home/', to: "static#home"
  get "/products/:product_id/orders/create", to: "orders#create"
  
  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
