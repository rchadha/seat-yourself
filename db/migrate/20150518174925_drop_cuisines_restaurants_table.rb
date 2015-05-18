class DropCuisinesRestaurantsTable < ActiveRecord::Migration
  def up
    drop_table :cuisines_restaurants

  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
