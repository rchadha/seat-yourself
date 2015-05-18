class RestaurantsController < ApplicationController

  def index
  	#render "another_page"
  	#@restaurants = Restaurant.all
    if params[:cuisine_id]
      @restaurants = Restaurant.joins(:cuisines).where("cuisine_id = ?", params[:cuisine_id])
    else
      @restaurants = Restaurant.all
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