class FishController < ApplicationController

  def new
    @tank = Tank.find(params[:tank_id])
    @fish = Fish.new
  end

  def create
    @fish = Fish.new(fish_params)
    if @fish.save
      redirect_to tank_fish_path(params[:tank_id], @fish)
    else
      render :new
    end
  end

  def edit
    @tank = Tank.find(params[:tank_id])
    @fish = Fish.find(params[:id])
  end

  def update
    @tank = Tank.find(params[:tank_id])
    @fish = Fish.find(params[:id])
      if @fish.update(fish_params)
        redirect_to tank_fish_path(@tank, @fish)
      else
        render :edit
      end
  end

  def show
    @fish = Fish.find(params[:id])
  end

  private

  def fish_params
    params.require(:fish).permit(:name, :breed_id, :temperament, :purchase_store, :purchase_date, :cost).merge(tank_id: params[:tank_id])
  end
end
