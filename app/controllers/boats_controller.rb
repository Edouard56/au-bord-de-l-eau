class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :show]
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    @boats = Boat.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @boat = Boat.new
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
     if @boat.save
       redirect_to boat_path(@boat)
     else
       render :new
     end
  end

  def edit
  end

  def update
    if @boat.update(boat_params)

      redirect_to boat_path(@boat)
    else
      render :edit
    end
  end

  def destroy
    @boat.destroy

    redirect_to boats_path
  end

private

  def set_boat
    @boat = Boat.find(params[:id])
  end

  def boat_params
    params.require(:boat).permit(:name, :address, :description, :price_per_day, :nb_of_passengers, :photo)
  end

end
