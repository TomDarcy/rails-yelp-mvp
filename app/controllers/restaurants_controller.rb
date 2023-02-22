class RestaurantsController < ApplicationController
  # A visitor can see the list of all restaurants.
  # A visitor can add a new restaurant, and be redirected to the show view of that new restaurant and save in db
  # A visitor can see the details of a restaurant, with all the reviews related to the restaurant.
  # A visitor can add a new review to a restaurant

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: @restaurant.id)
    # average rating
    @average_rating = @reviews.average(:rating)
  end

  def new
    @restaurant = Restaurant.new
    @categories = Restaurant::CATEGORY
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
