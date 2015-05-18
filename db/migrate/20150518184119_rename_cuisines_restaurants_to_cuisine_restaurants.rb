class RenameCuisinesRestaurantsToCuisineRestaurants < ActiveRecord::Migration
  def self.up
    rename_table :cuisines_restaurants, :cuisine_restaurants
  end
  def self.down
    rename_table :cuisine_restaurants, :cuisines_restaurants
  end
end
