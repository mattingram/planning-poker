Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  post "/create", to: "home#create"

  get "/rooms/:name", to: "rooms#show", as: "room_name"
end
