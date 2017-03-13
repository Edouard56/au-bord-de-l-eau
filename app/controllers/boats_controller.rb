class BoatsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
     if @boat.save
       redirect_to boat_path(@boat)
     else
       render :new
     end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :address, :description, :price_per_day, :nb_of_passengers)
  end

end
