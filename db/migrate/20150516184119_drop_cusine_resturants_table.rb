class DropCusineResturantsTable < ActiveRecord::Migration
  def up
    drop_table :cuisine_restaurants
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
