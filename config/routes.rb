Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  post "rooms/create", to: "rooms#create", as: "create_room"

  get "rooms/:name", to: "rooms#show", as: "show_room"

  put "rooms/:name", to: "rooms#reset", as: "reset_room"

  put "rooms/:name", to: "rooms#show_cards", as: "show_cards"

  put "users/:id/estimate", to: "users#estimate", as: "estimate_user"
end
