class RemoveBreedColumnFromFish < ActiveRecord::Migration
  def change
    remove_column :fish, :breed, :string
  end
end
