module Bizlogic



	def self.add_driver(name,contact,license_id,id_doc)
		driver = Driver.new(name: name, contact: contact)
		driver.license_id.attach(compress_resize(license_id)) if license_id.present?
		driver.photo_id.attach(id_doc) if id_doc.present?
		driver.save
	end

	def self.update_driver(id,name,contact,license_id,id_doc)
		driver = Driver.find_by_id(id)
		return false unless driver
		if driver.update(name: name, contact: contact)
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