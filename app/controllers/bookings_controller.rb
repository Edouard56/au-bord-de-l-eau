class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @booking.boat = Booking.find(params[:boat_id])
    if @booking.save
      redirect_to boats_path
    else
      render 'boats/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at)
  end

end
