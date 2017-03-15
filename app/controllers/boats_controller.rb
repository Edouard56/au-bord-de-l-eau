class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    @boats = Boat.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@boats) do |boat, marker|
      marker.lat boat.latitude
      marker.lng boat.longitude
      # marker.infowindow render_to_string(partial: "/boats/map_box", locals: { boat: boat })
    end
  end

  def show
    @booking = Booking.new
    @boat = Boat.find(params[:id])
    @alert_message =
    "Hello Buddy !
    Welcome on board of #{@boat.name} : #{@boat.description}
    Ready to go fishing with me"
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
