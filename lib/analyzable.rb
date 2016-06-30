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

	def average_price(product_arr)
		total_price = 0
		product_arr.each do |product|
			total_price += product.price.to_f
		end
		average_price = (total_price / product_arr.length).round(2)
    average_price
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
    puts "\n"
    brand_hash

   
    
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
     puts "\n"
     name_hash
    
     
  end
  def print_report(product_arr)
    average_price = average_price(product_arr).to_s + "\n"

    report = "Average Price $" + average_price
    report <<"Inventory by Brand: \n".colorize(:green)
    count_by_brand(product_arr).each do |brand, total|
      report << " - #{brand}: #{total}\n".colorize(:green)
    end
    
    report << "Inventory by Name:\n".colorize(:yellow)
    count_by_name(product_arr).each do |name, total|
      report << " - #{name}: #{total}\n".colorize(:yellow)
    end
    report
  end

  # def print_pretty_report(product_arr)

  #   # I tried a few things to clean up the report but it failed my tests. 
  #   # If there is a way to partion with ("=> +2 char "), I couldn't find it. Played with Class:String 
  #   report = 
  #   product_arr = product_arr
  #   average_price = average_price(product_arr).to_s
  #   brand_report = count_by_brand(product_arr).to_s
  #   name_report = count_by_name(product_arr).to_s
  #   puts brand_report
  #   puts name_report

  #   #Prettier code, but it makes the tests fail. 
  #   puts "Brand Performance".upcase.colorize(:green)
  #   puts
  #   pretty_brand_report = brand_report.delete("{""}") #Caused test to fail, made new variable names
  #   pretty_brand_report = pretty_brand_report.gsub(/[,]/, "\n")
  #   puts pretty_brand_report
  #   puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:magenta)
  #   puts "Unit Performance".upcase.colorize(:green)
  #   puts
  #   pretty_name_report = name_report.delete("{""}")
  #   pretty_name_report = pretty_name_report.gsub(/[,]/, "\n")
  #   puts pretty_name_report
  #   puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:magenta)

    
    
  # end
end

  

    
