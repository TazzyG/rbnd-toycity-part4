require_relative 'find_by'
require_relative 'errors'


module Analyzable

	@@data_path = File.dirname(__FILE__) + "/../data/data.csv"

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
     name_hash 
  end


  def print_report(product_arr)
    average_price = average_price(product_arr).to_s + "\n"

    report = "Average Price $" + average_price
    report <<"Inventory by Brand: \n"
    count_by_brand(product_arr).each do |brand, total|
      report << " - #{brand}: #{total}\n"
    end
    
    report << "Inventory by Name:\n"
    count_by_name(product_arr).each do |name, total|
      report << " - #{name}: #{total}\n"
    end
    report
  end

end

  

    
