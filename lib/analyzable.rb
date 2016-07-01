require_relative 'find_by'
require_relative 'errors'
require_relative 'count_by'


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

  #replaced with metaprogramming, thanks to awesome reviewer who gave tip. :)
  create_count_methods(:brand)
  create_count_methods(:name)


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

  

    
