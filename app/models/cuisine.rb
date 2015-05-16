class Cuisine < ActiveRecord::Base
  #dependent destroy...if we destroy Cuisine, we should destroy from CusineRestaurants
 has_and_belongs_to_many :Restaurants
end
