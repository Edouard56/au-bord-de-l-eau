class UsersController < ApplicationController

  def show
    @boats = current_user.boats
    @requests_on_my_boats = []
    @boats.each do |boat|
      boat.bookings.each do |booking|
        @requests_on_my_boats << booking
      end
    end
  end

end
