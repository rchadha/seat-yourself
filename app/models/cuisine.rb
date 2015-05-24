class Cuisine < ActiveRecord::Base
  has_many :cuisine_restaurants, dependent: :destroy
  #dependent destroy...if we destroy Cuisine, we should destroy relationship from
  #CusineRestaurants
  has_many :Restaurants, :through => :cuisine_restaurants
end

