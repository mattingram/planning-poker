Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  post "rooms/create", to: "rooms#create", as: "create_room"

  get "rooms/:name", to: "rooms#show", as: "show_room"
end
