# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.destroy_all
#CuisineRestaurant.destroy_all

x= 10

x.times do |x|
  r = Restaurant.new
  r.name = Faker::Company.name
  r.capacity = Faker::Number.number(2)
  r.city = Faker::Address.city
  r.address = Faker::Address.street_address
  r.postal_code = Faker::Address.postcode
  r.phone_number = Faker::PhoneNumber.phone_number
  r.save
  if x.even?
    r.cuisine_restaurants.create(cuisine: Cuisine.first)
  else
    r.cuisine_restaurants.create(cuisine: Cuisine.last)

  end

end
