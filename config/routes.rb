Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  post "rooms/create", to: "rooms#create", as: "create_room"
  get "rooms/:name", to: "rooms#index", as: "show_room"
  put "rooms/:name/reset", to: "rooms#reset", as: "reset_room"
  post "rooms/:name/leave", to: "rooms#leave", as: "leave_room"
  put "rooms/:name/show_cards", to: "rooms#show_cards", as: "show_cards"
  post "rooms/:name/join", to: "rooms#join", as: "join_room"

  put "users/estimate", to: "users#estimate", as: "estimate_user"
  put "users/set_name", to: "users#set_name", as: "set_name_user"
end
