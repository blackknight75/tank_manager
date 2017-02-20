class AddTankToTankFeatures < ActiveRecord::Migration
  def change
    add_reference :tank_features, :tank, index: true, foreign_key: true
  end
end
