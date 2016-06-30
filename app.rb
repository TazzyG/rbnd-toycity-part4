# for gems from udacitask-part2

require_relative 'lib/analyzable'
require_relative 'lib/product'
require_relative 'data/schema'
require_relative 'data/seeds'

include Analyzable

setup

def pretty_lines
	puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
end

# Uncomment the following code once ALL your tests have passed!

db_create

pretty_lines
puts "RETURN ALL PRODUCTS"
pretty_lines
print Product.all
puts
pretty_lines
puts "CREATE PRODUCTS"
pretty_lines
print Product.create(brand: "Udacity", name: "yoyo", price: 10.00)
print Product.create(brand: "Bouncy", name: "ball", price: 12.00)
print Product.create(brand: "MyCool", name: "dollhouse", price: 14.40)
print Product.create(brand: "MySoft", name: "stuffed animal", price: 2.09)
print Product.create(brand: "AllMy", name: "yoyo", price: 1.00)
print Product.create(brand: "Udacity", name: "doll", price: 5.99)

pretty_lines
puts "RETURN ALL PRODUCTS"
print Product.all
puts
# puts "--------------------------------------------------------------"
# puts "TEST ERROR HANDLING FOR DELETE - COMMENT OUT BEFORE SUBMITTING"
# puts "--------------------------------------------------------------"
# print Product.destroy(1000000000000)

# puts "------------------------------------------------------------"
# puts "TEST ERROR HANDLING FOR FIND - COMMENT OUT BEFORE SUBMITTING"
# puts "------------------------------------------------------------"
# print Product.find(1000000000000)

puts
pretty_lines
puts "RETURN FIRST PRODUCT"
pretty_lines
print Product.first


puts
pretty_lines
puts "RETURN FIRST 2 PRODUCTS"
pretty_lines
print Product.first(2)

puts
pretty_lines
puts "RETURN LAST PRODUCT"
pretty_lines
print Product.last

puts
pretty_lines
puts "RETURN LAST 2 PRODUCTS"
pretty_lines
print Product.last(2)

puts
pretty_lines
puts "DESTROY PRODUCT WITH ID 2"
pretty_lines
print Product.destroy(2)

puts
pretty_lines
puts "FIND PRODUCT 4 AND UPDATE BRAND"
pretty_lines
print Product.find(4).update(brand: "NewBrand")

puts
pretty_lines
puts "FIND PRODUCT 1"
pretty_lines
print Product.find(1)

puts
pretty_lines
puts "DESTROY PRODUCT 3"
pretty_lines
print Product.destroy(3)

puts
pretty_lines
puts "RETURN PRODUCTS WITH BRAND UDACITY"
pretty_lines
print Product.where(brand: "Udacity")

puts
pretty_lines
puts "RETURN FIRST PRODUCT WITH GIVEN BRAND"
pretty_lines
print Product.find_by_brand("Udacity")
puts

puts
pretty_lines
puts "RETURN FIRST PRODUCT WITH GIVEN NAME"
pretty_lines
print Product.find_by_name("yoyo")
puts

puts
pretty_lines
puts "RETURN HASH WITH NAME COUNTS"
pretty_lines
puts Analyzable::count_by_name(Product.all)
pretty_lines
puts
pretty_lines
puts "RETURN HASH WITH BRAND COUNTS"
pretty_lines
puts Analyzable::count_by_brand(Product.all)
pretty_lines
puts
pretty_lines
puts "RETURN AVERAGE PRICE"
pretty_lines
puts Analyzable::average_price(Product.all)

puts
pretty_lines
puts "PRINT SUMMARY REPORT"
pretty_lines
puts 
puts
puts Analyzable::print_report(Product.all)
puts

puts
