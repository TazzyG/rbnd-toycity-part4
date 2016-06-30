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
		(total_price / product_arr.length).round(2)
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
    table = Terminal::Table.new :rows => brand_hash
    print table
    #brand_hash
    
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
     table = Terminal::Table.new :rows => name_hash
     print table

  end

  ## tried a table but lines seem to look better. 
  # def print_report(objects_array)
  #   print "INVENTORY BY BRAND".colorize(:yellow)
  #   count_by_brand(objects_array).each do |k, v|
  #    print "  #{k}: #{v}".colorize(:yellow)
  #   end
  #   print "INVENTORY BY BRAND".colorize(:green)
  #   count_by_brand(objects_array).each do |k, v|
  #   print "  #{k}: #{v}".colorize(:green)
  #   end
  # end

  

    
	
end