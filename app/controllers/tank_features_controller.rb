class TankFeaturesController < ApplicationController

  def new
    @tank = Tank.find(params[:tank_id])
    @tank_feature = TankFeature.new
  end

  def create
    @tank_feature = TankFeature.new(tank_feature_params)
    if @tank_feature.save
      redirect_to user_tank_path(current_user, @tank_feature.tank)
    else
      render :new
    end
  end

  private

  def tank_feature_params
    params.require(:tank_feature).permit(:name, :cost, :description).merge(tank_id: params[:tank_id])
  end
end
