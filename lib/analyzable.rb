require_relative 'find_by'
require_relative 'errors'
require 'colorize'
require 'awesome_print'
require 'terminal-table'

module Analyzable

	@@data_path = File.dirname(__FILE__) + "/../data/data.csv"

	def setup
    @data_path = File.dirname(__FILE__) + "/../data/data.csv"
    CSV.open(@data_path, "wb") do |csv|
      csv << ["id", "brand", "product", "price"]
    end
    db_seed
  end

  def print_report(product_arr)
    report = "INVENTORY BY BRAND :\n=================\n".colorize(:yellow)
    count_by_brand(product_arr).each do |brand, total|
      report << " -   #{brand}. #{total}\n".colorize(:yellow)
    end
       
    report << "\n INVENTORY BY NAME :\n==================\n".colorize(:green)
    count_by_name(product_arr).each do |name, total|
      report << " -   #{name}: #{total}\n".colorize(:green)
    end
    report
  end


	def average_price(product_arr)
		total_price = 0
		product_arr.each do |product|
			total_price += product.price.to_f
		end
		average_price = (total_price / product_arr.length).round(2)
    puts average_price
	end

	def count_by_brand(product_arr)
  brand_hash = {} 
    product_arr.each do |product|
      unless brand_hash.include? product.brand
        brand_hash["#{product.brand}"] = 1
      else
        brand_hash["#{product.brand}"] += 1
      end
    end
    brand_table = Terminal::Table.new :title => "count by brand", :rows => brand_hash
    print brand_table
    # brand_hash
    
  end

  ## tried to create meta method for this, similar to find_by using count by, but went nuts.
  def count_by_name(product_arr)
  name_hash = {}
    product_arr.each do |product|
      unless name_hash.include? product.name
        name_hash["#{product.name}"] = 1
      else
        name_hash["#{product.name}"] += 1
      end
    end
     name_table = Terminal::Table.new :title => "count by name", :rows => name_hash
     print name_table
     #name_hash

  end

  def print_report(product_arr)
    average_price(product_arr)
    puts 
    count_by_brand(product_arr)
    puts
    count_by_name(product_arr)
  end

  # def print_report(product_arr)
  #   rows_of_report = {}
  #   rows_of_report =  {:title => "Inventory by Brand"}
  #   # undefined method `each' for nil:NilClass (NoMethodError)
  #   count_by_brand(product_arr).each do |brand, total|
  #   # undefined method `each' for nil:NilClass (NoMethodError)  
  #     rows_of_report.merge({:brand => :total})
  #   end
  #   rows_report.push("Inventory by Name")
  #   count_by_name(product_arr).each do |name, total|
  #     rows_of_report.merge({:name => :total})  
  #   end
  #   inventory_table = Terminal::Table.new :rows => rows_of_report
  #   print inventory_table
    
  # end
    
  # ## tried a table but lines seem to look better. 
  # def print_report(product_arr)
  #   report = "Inventory by Brand: \n"
  #   count_by_brand(product_arr).each do |brand, total|
  #     report << " - #{brand}: #{total}\n"
  #   end
  #   report << "Inventory by Name:\n"
  #   count_by_name(product_arr).each do |name, total|
  #     report << " - #{name}: #{total}\n"
  #   end
  #   #table = Terminal::Table.new :rows => report
  #   return report
    
  # end
end

  

    
