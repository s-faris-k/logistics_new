module Bizlogic


	def self.add_trip(date, vehicle_id, driver_id, client_id, start_km, start_location, end_km, end_location, status)
	  # Initialize a new trip with the provided parameters
	  trip = Trip.new(
	    date: date,
	    vehicle_id: vehicle_id,
	    driver_id: driver_id,
	    client_id: client_id,
	    start_km: start_km,
	    start_loc: start_location,
	    end_km: end_km,
	    end_loc: end_location,
	    trip_status: status # Directly assign status passed from controller
	  )

	  # Only assign the trip status based on km values if the trip is not "Enqueue"
	  if status != "Enqueue"
	    if start_km.nil?
	      trip.trip_status = "Occupied"
	    elsif start_km.present? && end_km.nil?
	      trip.trip_status = "En-Route"
	    elsif end_km.present?
	      trip.trip_status = "Closed"
	    end
	  end

	  # Save the new trip and return true or false based on success
	  if trip.save
	    return true
	  else
	    return false
	  end
	end


	def self.add_driver(name,contact,license_id,id_doc,status)
		driver = Driver.new(name: name, contact: contact,status:status)
		driver.license_id.attach(compress_resize(license_id)) if license_id.present?
		driver.photo_id.attach(id_doc) if id_doc.present?
		driver.save
	end

	def self.update_driver(id,name,contact,license_id,id_doc,status)
		driver = Driver.find_by_id(id)
		return false unless driver
		if driver.update(name: name, contact: contact,status: status)
			driver.license_id.attach(compress_resize(license_id)) if license_id.present?
			driver.photo_id.attach(id_doc) if id_doc.present?
			true
		else
			false
		end
	end



	def self.add_client(name,contact,doc)
	  vehicle = Client.new(name: name, contact: contact)
	  vehicle.doc.attach(doc) if doc.present?
	  vehicle.save
	end

	def self.update_client(id,name,contact,doc)
	  client = Client.find_by_id(id)
	  return false unless client
	  if client.update(name: name, contact: contact)
	    client.doc.attach(doc) if doc.present?
	    true
	  else
	    false
	  end
	end

	def self.add_vehicle(name, number, status, image, doc)
	  vehicle = Vehicle.new(name: name, number: number, status: status)
	  vehicle.image.attach(compress_resize(image)) if image.present?
	  vehicle.doc.attach(doc) if doc.present?
	  vehicle.save
	end

	def self.update_vehicle(id, name, number, status, image, doc)
	  vehicle = Vehicle.find_by_id(id)
	  return false unless vehicle

	  if vehicle.update(name: name, number: number, status: status)
	    vehicle.image.attach(compress_resize(image)) if image.present?
	    vehicle.doc.attach(doc) if doc.present?
	    true
	  else
	    false
	  end
	end


	def self.compress_resize(uploaded_file)
	  image = MiniMagick::Image.read(uploaded_file.tempfile)
	  image.resize "800x600"
	  image.quality 80
	  img_data = image.to_blob

	  temp_img = Tempfile.new(['resized_image', '.jpg'], binmode: true)
	  temp_img.write(img_data)
	  temp_img.rewind

	  {
	    io: temp_img,
	    filename: "compressed_#{uploaded_file.original_filename}",
	    content_type: 'image/jpeg'
	  }
	end

end