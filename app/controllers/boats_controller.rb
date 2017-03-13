class BoatsController < ApplicationController
  before_action :set_boat, only: [:show]

  def index
    @boats = Boat.all
  end

  def show

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :address, :description, :price_per_day, :nb_of_passengers, :photo)
  end

end
