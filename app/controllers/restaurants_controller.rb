class RestaurantsController < ApplicationController
  #before_action :authenticate_user!, :except => [:index]
  #before_action :authenticate_user!, :only => [:show]

  def index
  	if params[:cuisine_id]
      @restaurants = Restaurant.joins(:cuisines).where("cuisine_id = ?", params[:cuisine_id])
    else
      @restaurants = Restaurant.all
    end

    @hash = Gmaps4rails.build_markers(@restaurants.all.where("latitude IS NOT NULL OR longitude IS NOT NULL")) do |restaurant, marker|
        marker.lat restaurant.latitude
        marker.lng restaurant.longitude
        marker.infowindow restaurant.name
          # marker.picture({
          #   "url" => "/logo.png",
          #   "width" =>  36,
          #   "height" => 36
          # })
      
      end

  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reservation = Reservation.new

  end

  # GET /restaurants/new
  def new
   @restaurant = Restaurant.new

  end

  #GET /restaurants/1/edit
  def edit

  end

  #POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)


    respond_to do |format|
      if @restaurant.save
        @restaurant.cuisine_restaurants.create(cuisine: Cuisine.first)
        format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :capacity, :address, :city, :phone_number)
  end

end