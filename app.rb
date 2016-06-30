# for gems from udacitask-part2
require 'colorize'
require 'awesome_print'


require_relative 'lib/analyzable'
require_relative 'lib/product'
require_relative 'data/schema'
require_relative 'data/seeds'

include Analyzable

setup

# Uncomment the following code once ALL your tests have passed!

db_create

puts "-------------------"
puts "RETURN ALL PRODUCTS"
puts "-------------------"
ap Product.all
puts
puts "-----------------"
puts "CREATE PRODUCTS"
puts "-----------------"
ap Product.create(brand: "Udacity", name: "yoyo", price: 10.00)
ap Product.create(brand: "Bouncy", name: "ball", price: 12.00)
ap Product.create(brand: "MyCool", name: "dollhouse", price: 14.40)
ap Product.create(brand: "MySoft", name: "stuffed animal", price: 2.09)
ap Product.create(brand: "AllMy", name: "yoyo", price: 1.00)
ap Product.create(brand: "Udacity", name: "doll", price: 5.99)

puts "-------------------"
puts "RETURN ALL PRODUCTS"
puts "-------------------"
ap Product.all

# puts "--------------------------------------------------------------"
# puts "TEST ERROR HANDLING FOR DELETE - COMMENT OUT BEFORE SUBMITTING"
# puts "--------------------------------------------------------------"
# print Product.destroy(1000000000000)

# puts "------------------------------------------------------------"
# puts "TEST ERROR HANDLING FOR FIND - COMMENT OUT BEFORE SUBMITTING"
# puts "------------------------------------------------------------"
# print Product.find(1000000000000)

puts
puts "--------------------"
puts "RETURN FIRST PRODUCT"
puts "--------------------"
ap Product.first


puts
puts "-----------------------"
puts "RETURN FIRST 2 PRODUCTS"
puts "-----------------------"
ap Product.first(2)

puts
puts "-------------------"
puts "RETURN LAST PRODUCT"
puts "-------------------"
ap Product.last

puts
puts "----------------------"
puts "RETURN LAST 2 PRODUCTS"
puts "----------------------"
ap Product.last(2)

puts
puts "-------------------------"
puts "DESTROY PRODUCT WITH ID 2"
puts "-------------------------"
ap Product.destroy(2)

puts
puts "-------------------------------"
puts "FIND PRODUCT 4 AND UPDATE BRAND"
puts "-------------------------------"
ap Product.find(4).update(brand: "NewBrand")

puts
puts "--------------"
puts "FIND PRODUCT 1"
puts "--------------"
ap Product.find(1)

puts
puts "-----------------"
puts "DESTROY PRODUCT 3"
puts "-----------------"
ap Product.destroy(3)

puts
puts "-------------------------------"
puts "RETURN PRODUCTS WITH BRAND UDACITY"
puts "-------------------------------"
ap Product.where(brand: "Udacity")

puts
puts "-------------------------------------"
puts "RETURN FIRST PRODUCT WITH GIVEN BRAND"
puts "-------------------------------------"
ap Product.find_by_brand("Udacity")
puts

puts
puts "------------------------------------"
puts "RETURN FIRST PRODUCT WITH GIVEN NAME"
puts "------------------------------------"
ap Product.find_by_name("yoyo")
puts

puts
puts "----------------------------"
puts "RETURN HASH WITH NAME COUNTS"
puts "----------------------------"
print Analyzable::count_by_name(Product.all)

puts
puts "----------------------------"
puts "RETURN HASH WITH BRAND COUNTS"
puts "----------------------------"
print Analyzable::count_by_brand(Product.all)

puts
puts "--------------------"
puts "RETURN AVERAGE PRICE"
puts "--------------------"
print Analyzable::average_price(Product.all)

puts
puts "--------------------"
puts "PRINT SUMMARY REPORT"
puts "--------------------"
print Analyzable::print_report(Product.all)
puts

puts
