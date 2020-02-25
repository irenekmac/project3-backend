class RestaurantsController < ApplicationController

  def new
    @resto = Restaurant.new
  end

  def create
    @current_user.submitted_restaurants.create order_params
  end

  def index
    # @resto = Restaurant.all

    # Current logged-in user can see team suggested orders
    @resto = Restaurant.where user_id: @current_user.id
  end

  def show
    @resto = Restaurant.find params[:id]
  end

  def edit
    @resto = Restaurant.find params[:id]
  end

  def update
    @resto = Restaurant.find params[:id]
    @resto.update resto_params

    # Do update here
    redirect_to restaurants_path

    puts "~~~~~~~~~~~~~~~~ UPDATED ~~~~~~~~~~~~~~~~"
  end

  def destroy
    Restaurant.destroy params[:id]

    redirect_to restaurants_path
  end

  # 1. root route gets sent to custom method in this controller
  # 2. Write custom method for anything you might need in this page
  # 3. Gets send to the view
  # 4. View displays the homepage & any links e.c.t.
  # get'/' => 'restaurants#homepage'
  def homepage
    # renders a random restaurant from the users' database

    # @resto = Restaurant.where user_id: @current_user.id

    # Get the user restaurant
    # @user_rest = User.first.restaurants.order('RANDOM()').first
    @present_user = @current_user

    if @present_user
      return @resto = @present_user.restaurants.order('RANDOM()').first
    else
      return @resto = Restaurant.order('RANDOM()').first
    end


  end

  private

  def resto_params
    params.require(:restaurant).permit( :name, :address, :price, :cuisine, :eatin, :eatout )
  end

  def check_ownership
    redirect_to login_path and return unless @resto.user == @current_user
  end
end
