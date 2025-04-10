Rails.application.routes.draw do


  # Defines the root path route ("/")
  # root "posts#index"

  root "login#login"
  get "logout", to: "login#logout"

  namespace :admin do
    get "home", to: "admin#home"
    get "drivers", to: "admin#drivers"
    get "expenses", to: "admin#expenses"
    get "clients", to: "admin#clients"
    get "trips", to: "admin#trips"
    get "vehicles", to: "admin#vehicles"

    post "add_trip", controller: "admin", action: "add_trip"

    post "add_driver", controller: "admin", action: "add_driver"

  end



  get "user_login", to:"login#user_login"
end
