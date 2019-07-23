Rails.application.routes.draw do

  # resources for Three modles
  resources :orders
  devise_for :users
  resources :products

 # routes for statics page
  get '/home/', to: "static#home"
  get '/about/', to: "static#about"
  get '/contact/', to: "static#contact"

  # routes for new methodes in orders controller
  get '/payment/', to: "orders#payment"
  get '/hestory/', to: "orders#hestory"
  get '/admin/', to: "orders#admin"
  get '/change/', to: "products#change"

  # route for create order and passing the product ID
  get "/products/:product_id/orders/create", to: "orders#create"
  
  root 'static#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
