class Tank < ActiveRecord::Base
  belongs_to :user
  has_many :fish
  has_many :tank_features

  def fish_count
    self.fish.count
  end

end
