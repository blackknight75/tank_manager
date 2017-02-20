class AddCostColumnToFish < ActiveRecord::Migration
  def change
    add_column :fish, :cost, :float
  end
end
