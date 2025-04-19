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

    ###########################   vehcile
    post "add_vehicle", controller: "admin", action: "add_vehicle"
    post "update_vehicle", controller: "admin", action: "update_vehicle"
    get "delete_vehicle", controller: "admin", action: "delete_vehicle"
    delete 'delete_veh_doc', controller: "admin", action: "delete_vehicle_doc"
    delete 'delete_veh_image', controller: "admin", action: "delete_vehicle_image"


    #######################  clients

    post "add_client", controller: "admin", action: "add_client"
    post "update_client", controller: "admin", action: "update_client"
    get "delete_client", controller: "admin", action: "delete_client"
    delete 'delete_client_doc', controller: "admin", action: "delete_client_doc"

    ######################   drivers


    post "add_client", controller: "admin", action: "add_driver"
    post "update_driver", controller: "admin", action: "update_driver"
    get "delete_driver", controller: "admin", action: "delete_driver"
    delete 'delete_driver_license', controller: "admin", action: "delete_driver_license"
    delete 'delete_driver_id', controller: "admin", action: "delete_driver_id"


  end



  get "user_login", to:"login#user_login"
end
