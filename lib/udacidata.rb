require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata

	# data path from schema
	@@data_path = File.dirname(__FILE__) + "/../data/data.csv"

  create_finder_methods(:brand, :name)

 	def self.create(attributes = nil)

    CSV.foreach(@@data_path) do |row|
      if row[0] == attributes[:id]
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

  def self.take_items(from, n=nil)
      n ? all.send(from, n) : all.public_send(from)
  end

  def self.first(n=nil)
        self.take_items(:first, n)
  end

  def self.last(n=nil)
       self.take_items(:last, n)
  end
  
 	def self.find(id)
    item = self.all.select {|item| item.id == id}.first 
    unless item
      raise ProductNotFoundError, "Product id: #{id} not found."
    end
    item
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


