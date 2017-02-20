class CreateTankFeatures < ActiveRecord::Migration
  def change
    create_table :tank_features do |t|
      t.string :name
      t.string :description
      t.float :cost

      t.timestamps null: false
    end
  end
end
