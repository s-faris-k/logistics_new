class Admin::AdminController < ApplicationController
	layout "admin"

	include Bizlogic
  
	def home
	end
	def expenses
	end

	def add_trip
	end
	def drivers
		@drivers = Driver.all
	end
	def add_driver
		name = params[:name]
		contact = params[:contact]
		license = params[:license]
		id_doc = params[:id_doc]
		if Bizlogic.add_driver(name,contact,license,id_doc)
			flash[:success] = "Vehicle details added "
		else
			flash[:error] = "Unable to add details , Try later"
		end
		redirect_to admin_drivers_path	
	end
	def update_driver
		id = params[:driver_id]
		name = params[:name]
		contact = params[:contact]
		license = params[:license]
		id_doc = params[:id_doc]
		if Bizlogic.update_driver(id,name,contact,license,id_doc)
			flash[:success] = "Vehicle details added "
		else
			flash[:error] = "Unable to add details , Try later"
		end
		redirect_to admin_drivers_path
	end

	def delete_driver
		id = params[:driver_id]
		if Driver.find_by_id(id).destroy
			flash[:success] = "Driver details Removed "
		else
			flash[:error] = "Unable to Remove details , Try later"
		end
		redirect_to admin_drivers_path	
	end

	def delete_driver_license
		driver = Driver.find(params[:driver_id])
		driver.license_id.purge if driver.license_id.attached?
		flash[:success] = "Image deleted successfully."
		redirect_to admin_drivers_path
	end

	def delete_driver_id
		driver = Driver.find(params[:driver_id])
		driver.photo_id.purge if driver.photo_id.attached?
		flash[:success] = "Document deleted successfully."
		redirect_to admin_drivers_path
	end
  
	def vehicles
		@vehicles = Vehicle.all
	end
	def add_vehicle
		name = params[:model]
		number = params[:reg_number]
		status = params[:status]
		image = params[:image]
		doc = params[:doc]
		if Bizlogic.add_vehicle(name,number,status,image,doc)
			flash[:success] = "Vehicle details added "
		else
			flash[:error] = "Unable to add details , Try later"
		end
		redirect_to admin_vehicles_path	
	end

	def delete_vehicle
		id = params[:veh_id]
		if Vehicle.find_by_id(id).destroy
			flash[:success] = "Vehicle details Removed "
		else
			flash[:error] = "Unable to Remove details , Try later"
		end
		redirect_to admin_vehicles_path	
	end

	def update_vehicle
		id = params[:vehicle_id]
		name = params[:model]
		number = params[:reg_number]
		status = params[:status]
		image = params[:image]
		doc = params[:doc]
		if Bizlogic.update_vehicle(id,name,number,status,image,doc)
			flash[:success] = "Vehicle details Saved "
		else
			flash[:error] = "Unable Update details , Try later"
		end
		redirect_to admin_vehicles_path	
	end

	def delete_vehicle_doc
		vehicle = Vehicle.find(params[:veh_id])
		vehicle.doc.purge if vehicle.doc.attached?
		flash[:success] = "Document deleted successfully."
		redirect_to admin_vehicles_path
	end

	def delete_vehicle_image
		vehicle = Vehicle.find(params[:veh_id])
		vehicle.image.purge if vehicle.image.attached?
		flash[:success] = "Image deleted successfully."
		redirect_to admin_vehicles_path
	end





	def clients
		@clients = Client.all
	end

	def add_client
		name = params[:name]
		contact = params[:contact]
		doc = params[:doc]
		if Bizlogic.add_client(name,contact,doc)
			flash[:success] = "Vehicle details added "
		else
			flash[:error] = "Unable to add details , Try later"
		end
		redirect_to admin_clients_path	
	end

	def update_client
		id = params[:client_id]
		name = params[:name]
		contact = params[:contact]
		doc = params[:doc]
		if Bizlogic.update_client(id,name,contact,doc)
			flash[:success] = "Client details Saved "
		else
			flash[:error] = "Unable to Update details , Try later"
		end
		redirect_to admin_clients_path	
	end

	def delete_client
		id = params[:cl_id]
		if Client.find_by_id(id).destroy
			flash[:success] = "Client details Removed "
		else
			flash[:error] = "Unable to Remove details , Try later"
		end
		redirect_to admin_clients_path	
	end

	def delete_client_doc
		client = Client.find(params[:veh_id])
		client.doc.purge if client.doc.attached?
		flash[:success] = "Document deleted successfully."
		redirect_to admin_clients_path
	end

	def trips
	  @trips = Trip.all
	  @vehicles = Vehicle.all
	  @drivers = Driver.all
	  @clients = Client.all
	end








  end
  