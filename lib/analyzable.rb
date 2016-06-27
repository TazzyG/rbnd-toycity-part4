module Analyzable
  # Your code goes here!
end

### From the Features Section in ToyCity 4 Prep

# count_by_brand should accept an array of Product objects and return a hash with inventory counts, organized by brand.
# Analyzable::count_by_brand(Product.all)
# #=> {"Lego"=>3, "Fisher-Price"=>2, "Nintendo"=>1, "Crayola"=>2, "Hasbro"=>2}
# count_by_name should accept an array of Product objects and return a hash with inventory counts, organized by product name.
# Analyzable::count_by_name(Product.all)
# #=> {"Sleek Linen Watch"=>2, 
# "Heavy Duty Iron Bottle"=>5, 
# "Lightweight Paper Table"=>1, 
# "Heavy Duty Wool Shirt"=>1, 
# "Enormous Paper Computer"=>1}
# average_price should accept an array of Product objects and return the average price. (To find the average price: add up the prices and divide by the number of prices you added together.)
# Analyzable::average_price(Product.all)
# #=> 51.44
# print_report should accept an array of Product objects and return a summary inventory report containing: average price, counts by brand, and counts by product name.
# Analyzable::print_report(Product.all)
# #=> Average Price: $51.6
# Inventory by Brand:
#   - Hasbro: 5
#   - Fisher-Price: 1
#   - Crayola: 2
#   - Lego: 2
# Inventory by Name:
#   - Incredible Copper Bag: 3
#   - Synergistic Rubber Car: 2
#   - Aerodynamic Marble Computer: 3
#   - Synergistic Wooden Chair: 2
