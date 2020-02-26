class RestaurantsController < ApplicationController

  def new
    @resto = Restaurant.new
  end

  def create
    @current_user.submitted_restaurants.create order_params

    respond_to do |format|
      if @current_user.save
        format.html { redirect_to @current_user, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @current_user }
      else
        format.html { render :new }
        format.json { render json: @current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    headers['Access-Control-Allow-Origin'] = '*'
    # @resto = Restaurant.all

    # Current logged-in user can see team suggested orders
    @resto = Restaurant.where user_id: @current_user.id
  end

  def show
    @resto = Restaurant.find params[:id]

    render json: @resto
  end

  def edit
    @resto = Restaurant.find params[:id]
  end

  def update
    @resto = Restaurant.find params[:id]
    @resto.update resto_params

    respond_to do |format|
      if @resto.update(resto_params)
        format.html { redirect_to @resto, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @resto }
      else
        format.html { render :edit }
        format.json { render json: @resto.errors, status: :unprocessable_entity }
      end
    end

    # Do update here
    redirect_to restaurants_path

    puts "~~~~~~~~~~~~~~~~ UPDATED ~~~~~~~~~~~~~~~~"
  end

  def destroy
    Restaurant.destroy params[:id]

    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end

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

  def action
    # call
    respond_to do |format|
      format.json { render json: results }
    end

  end

  private

    def resto_params
      params.require(:restaurant).permit( :name, :address, :price, :cuisine, :eatin, :eatout )
    end

    def allow_cors
        headers['Access-Control-Allow-Origin'] = '*'
      end

    def check_ownership
      redirect_to login_path and return unless @resto.user == @current_user
    end

  end
