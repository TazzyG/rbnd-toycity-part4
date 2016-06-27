require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  
@@data_path = File.dirname(__FILE__) + "/../data/data.csv"

def self.create(attributes = nil)
	# Find the item, if it doesn't exist redirect to new.
	# Check if object is in the database (true) pass to new false, create the object (next step).
	# If the object's data is not in the database;
  # create the object
  # return the object 
end 

def self.new(opts = {})
	
	# The attributes represent an object that already exists in the database. 
	# Pass the attributes into new, and return the created object.
  # If the object's data is already in the database
  # create the object (biz term .. as a new record)
  # save the data in the database
  # return the object
  newItem = self.new(opts) 
  insert_into_db newItem
end

def self.all

end

def self.find(id)

end

def self.find_by(options = {})
	# brand
	# name

end

def self.where(type, name)
end

def self.destroy
end

def self.update
	# product_instance.update (in the product class)
end

# ..

end

	private
	def self.insert_into_db(data)
		if !File.exist?(@@data_path)
			CSV.open(data_path, "wb") do |csv|
				csv << ["id", "brand", "name", "price"]
		end
	end

	def update_db(data)
		header = CSV.read(@@data_path)[0]
		table = CSV.table(@@data_path)

		table.each do |row|
			if(row[:id].to_i == id)
				header.each do |field|
					row[field.to_s] = 
	end
end


