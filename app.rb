# for gems from udacitask-part2
require 'colorize'
require 'awesome_print'
require 'terminal-table'

require_relative 'lib/analyzable'
require_relative 'lib/product'
require_relative 'data/schema'
require_relative 'data/seeds'

include Analyzable

setup

def pretty_lines
	puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".colorize(:magenta)
end

# Uncomment the following code once ALL your tests have passed!

db_create

pretty_lines
puts "RETURN ALL PRODUCTS".colorize(:green)
pretty_lines
ap Product.all
puts
pretty_lines
puts "CREATE PRODUCTS".colorize(:green)
pretty_lines
ap Product.create(brand: "Udacity", name: "yoyo", price: 10.00)
ap Product.create(brand: "Bouncy", name: "ball", price: 12.00)
ap Product.create(brand: "MyCool", name: "dollhouse", price: 14.40)
ap Product.create(brand: "MySoft", name: "stuffed animal", price: 2.09)
ap Product.create(brand: "AllMy", name: "yoyo", price: 1.00)
ap Product.create(brand: "Udacity", name: "doll", price: 5.99)

pretty_lines
puts "RETURN ALL PRODUCTS".colorize(:green)
pretty_lines
ap Product.all
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
puts "RETURN FIRST PRODUCT".colorize(:green)
pretty_lines
ap Product.first


puts
pretty_lines
puts "RETURN FIRST 2 PRODUCTS".colorize(:green)
pretty_lines
ap Product.first(2)

puts
pretty_lines
puts "RETURN LAST PRODUCT".colorize(:green)
pretty_lines
ap Product.last

puts
pretty_lines
puts "RETURN LAST 2 PRODUCTS".colorize(:green)
pretty_lines
ap Product.last(2)

puts
pretty_lines
puts "DESTROY PRODUCT WITH ID 2".colorize(:green)
pretty_lines
ap Product.destroy(2)

puts
pretty_lines
puts "FIND PRODUCT 4 AND UPDATE BRAND".colorize(:green)
pretty_lines
ap Product.find(4).update(brand: "NewBrand")

puts
pretty_lines
puts "FIND PRODUCT 1".colorize(:green)
pretty_lines
ap Product.find(1)

puts
pretty_lines
puts "DESTROY PRODUCT 3".colorize(:green)
pretty_lines
ap Product.destroy(3)

puts
pretty_lines
puts "RETURN PRODUCTS WITH BRAND UDACITY".colorize(:green)
pretty_lines
ap Product.where(brand: "Udacity")

puts
pretty_lines
puts "RETURN FIRST PRODUCT WITH GIVEN BRAND".colorize(:green)
pretty_lines
ap Product.find_by_brand("Udacity")
puts

puts
pretty_lines
puts "RETURN FIRST PRODUCT WITH GIVEN NAME".colorize(:green)
pretty_lines
ap Product.find_by_name("yoyo")
puts

puts
pretty_lines
puts "RETURN HASH WITH NAME COUNTS".colorize(:green)
pretty_lines
puts Analyzable::count_by_name(Product.all)

puts
pretty_lines
puts "RETURN HASH WITH BRAND COUNTS".colorize(:green)
pretty_lines
puts Analyzable::count_by_brand(Product.all)

puts
pretty_lines
puts "RETURN AVERAGE PRICE".colorize(:green)
pretty_lines
puts Analyzable::average_price(Product.all)

puts
pretty_lines
puts "PRINT SUMMARY REPORT".colorize(:green)
pretty_lines
puts 

puts Analyzable::print_report(Product.all)
puts

puts
