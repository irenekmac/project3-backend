class RestaurantsController < ApplicationController

  def new
    @resto = Restaurant.new
  end

  def create
    @current_user.submitted_restaurants.create order_params
  end

  def index
    @resto = Restaurant.all
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

  private

  def resto_params
    params.require(:restaurant).permit( :name, :address, :price, :cuisine, :eatin, :eatout )
  end

  def check_ownership
    redirect_to login_path and return unless @resto.user == @current_user
  end
end
