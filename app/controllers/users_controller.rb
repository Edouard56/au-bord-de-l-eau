class UsersController < ApplicationController

  def show
    @boats = current_user.boats
  end

end
