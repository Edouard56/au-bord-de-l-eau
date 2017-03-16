class BookingsController < ApplicationController
  before_action :set_boat, only: [:create]

  def create
    @booking = Booking.new(booking_params)
    @booking.boat = Boat.find(params[:boat_id])
    @booking.user = current_user
    if @booking.save
      redirect_to boats_path
    else
      render 'boats/show'
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted = "yes"
    @booking.save

    redirect_to user_path

  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.accepted = "no"
    @booking.save

    redirect_to user_path
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end

  def set_boat
    @boat = Boat.find(params[:boat_id])
  end

end
