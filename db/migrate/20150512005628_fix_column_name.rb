class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :reservations, :resturant_id, :restaurant_id
  end
end
