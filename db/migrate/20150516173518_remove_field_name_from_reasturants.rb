class RemoveFieldNameFromReasturants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :cuisine_id, :integer
  end
end
