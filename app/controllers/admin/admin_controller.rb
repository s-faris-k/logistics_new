class Admin::AdminController < ApplicationController
	layout "admin"
  
	def home
	end
  
	def vehicles
	end
	def clients
	end
	def trips
	  @trips = Trip.all
	  @vehicles = Vehicle.all
	  @drivers = Driver.all
	  @clients = Client.all
	end

	def expenses
	end

	def add_trip
	end
	def add_driver
	end
  end
  