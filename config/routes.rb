Rails.application.routes.draw do
  get 'carts/show'
  get 'rails/g'
  get 'rails/controller'
  get 'rails/Carts'
  get 'rails/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "products#index"
  get '/product_view/:id', to: 'products#show'
  put '/product_edit/:id', to: 'products#edit'
  resources :products
  resources :registrations
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  post 'line_items' => "line_items#create"
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
  resources :carts
  resources :line_items
  resources :sessions
end
