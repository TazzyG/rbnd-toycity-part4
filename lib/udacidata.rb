require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata

	# data path from schema
	@@data_path = File.dirname(__FILE__) + "/../data/data.csv"

 	def self.create(attributes = nil)
    # this did not work, keeping for reference (churned quite a bit)
 		# products = []
 		# CSV.read(@@data_path, headers:true).each do |product|
 		# 	products << self.new(id: product["id"], brand: product["brand"], name: product["name"], price: product["price"])
   #  end
   #  products 

    CSV.foreach(@@data_path) do |row|
      if row[2] == attributes[:name]
        return self.new(id: row[0], brand: row[1], name: row[2], price: row[3])
      else
        object = self.new(attributes)
        CSV.open(@@data_path, "a") do |csv|
          csv << [object.id, object.brand, object.name, object.price]
        end
        return object
      end
    end
 	end

 	def self.all
 		products = []
 		CSV.foreach(@@data_path, headers: true) do |row|
 			products.push Product.new(id: row["id"], name: row["product"], brand: row["brand"], price: row["price"])
 		end
    
 		products
 	end

  def self.first(item = 1)
    item == 1 ? self.all.first : self.all.take(item)
  end

  def self.last(item = 1)
    item == 1 ? self.all.last : self.all.pop(item)
  end

 	def self.find(id)
    CSV.foreach(@@data_path, headers: true) do |row|
      if row["id"].to_i == id
        return Product.new(id: row["id"], name: row["product"], brand: row["brand"], price: row["price"])
      end
    end
    raise UdacidataErrors::ProductNotFoundError, "No product matches product id '#{id}'."
  end


 	def self.destroy(id)
 		product = self.find(id)
 		#http://ruby-doc.org/stdlib-1.9.2/libdoc/csv/rdoc/CSV/Table.html
    item = CSV.table(@@data_path)
    item.delete_if do |row|
      row[:id] == id
    end
    File.open(@@data_path, 'w') do |f|
      f.write(item.to_csv)
    end
    return product
    raise UdacidataErrors::ProductNotFoundError, "No product matches product id '#{id}'."
  end

  def self.where(options = {})
    result = self.all
    options.each do |key, value|
      result = result.select { |product| product.send(key) == value}
    end
    result
  end

  def self.reset_file
    CSV.open(@@data_path, "wb") do |csv|
      csv << ["id", "brand", "product", "price"]
    end
  end

 	def update(options={})
 		select = {}
 		select[:id] = self.id

 		options[:name] ? select[:name] = options[:name] : select[:name] = self.name
    options[:brand] ? select[:brand] = options[:brand] : select[:brand] = self.brand
    options[:price] ? select[:price] = options[:price] : select[:price] = self.price

    Product.destroy(self.id)
    Product.create(select)


 	end
end


