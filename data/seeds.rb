require 'faker'

# ref. Documentation for Faker gem https://github.com/stympy/faker#fakerbusiness
    
def db_seed
  10.times do 
  	Product.create(brand: Faker::Company.name, name: Faker::App.name, price: Faker::Commerce.price)
  end
end
