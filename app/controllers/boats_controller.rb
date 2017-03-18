class BoatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_boat, only: [:show, :edit, :update, :destroy]

  def index
    @boat = Boat.new(name: "faker", address: params[:search], description: "faker", price_per_day: 0, nb_of_passengers: 0)
    @boat.save
    @search_lng = @boat.longitude
    @search_lat = @boat.latitude
    @boat.destroy
    if params[:search] == ""
      @boats = Boat.where.not(latitude: nil, longitude: nil)
    elsif params[:search]
      @boats = Boat.near(params[:search], 200)
    else
      @boats = Boat.where.not(latitude: nil, longitude: nil)
    end
    if params[:search] == ""
      @hash = Gmaps4rails.build_markers(@boats) do |boat, marker|
        marker.lat boat.latitude
        marker.lng boat.longitude
        marker.infowindow render_to_string(partial: "/boats/map_box", locals: { boat: boat })
      end
    elsif params[:search]
      @hash = Gmaps4rails.build_markers(@boats) do |boat, marker|
        marker.lat boat.latitude
        marker.lng boat.longitude
        marker.infowindow render_to_string(partial: "/boats/map_box", locals: { boat: boat })
      end
      # var pinimage = new google.maps.MarkerImage("http://maps.google.com/mapfiles/ms/icons/blue-dot.png");
        # var marker = new google.maps.Marker({
        #     position : latlng,
        #     map : map,
        #     title : "Somu's House, Bitches!"
        # });

      @hash << {lng: @search_lng, lat: @search_lat, infowindow: "I am here" }

    else
       @hash = Gmaps4rails.build_markers(@boats) do |boat, marker|
        marker.lat boat.latitude
        marker.lng boat.longitude
        marker.infowindow render_to_string(partial: "/boats/map_box", locals: { boat: boat })
      end
    end
  end

  def show
    @booking = Booking.new
    @boat = Boat.find(params[:id])
    @hash = Gmaps4rails.build_markers(@boat) do |boat, marker|
      marker.lat boat.latitude
      marker.lng boat.longitude
      marker.infowindow render_to_string(partial: "/boats/map_box", locals: { boat: boat })
    end
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
    params.require(:boat).permit(
      :name,
      :organizer,
      :starts_at,
      :ends_at,
      :address,
      :street_address,
      :zipcode,
      :city,
      :description,
      :objectives,
      :photo)
  end

end
