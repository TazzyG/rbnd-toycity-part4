require_relative 'find_by'
require_relative 'errors'

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
    return brand_hash
  end

  def count_by_name(product_arr)
  name_hash = {}
    product_arr.each do |product|
      unless name_hash.include? product.name
        name_hash["#{product.name}"] = 1
      else
        name_hash["#{product.name}"] += 1
      end
    end
    return name_hash
  end




	def print_report(product_arr)
		report = "Inventory by Brand: \n"
		count_by_brand(product_arr).each do |brand, total|
			report << " - #{brand}: #{total}\n"
		end
		report << "Inventory by Name:\n"
		count_by_name(product_arr).each do |name, total|
			report << " - #{name}: #{total}\n"
		end
		return report
	end

end