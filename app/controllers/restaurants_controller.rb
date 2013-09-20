class RestaurantsController < ApplicationController

		def index
			@restaurants = Restaurant.all
		end
	
	  def show
	  	@restaurant = Restaurant.find(params[:id])
	  	@reservations = @restaurant.reservations
	
	    respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @restaurant }
	    end

	   
	  end
	
	  def new
	  	@restaurant = Restaurant.new
	
	    respond_to do |format|
	      format.html # new.html.erb
	      format.json { render json: @restaurants }
	    end
	  end
	
	  def edit
	  	@restaurant = Restaurant.find(params[:id])
	  end
	
	  def create
	  	@restaurant = Restaurant.new(restaurant_params)
	
	    respond_to do |format|
	      if @restaurant.save
	        format.html { redirect_to @restaurant, notice: 'restaurant was successfully created.' }
	        format.json { render json: @restaurant, status: :created, location: @restaurant }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
	      end
	    end
	  end
	
	  def update
	  	@restaurant = Restaurant.find(params[:id])
	
	    respond_to do |format|
	      if @restaurant.update(restaurant_params)
	        format.html { redirect_to @restaurant, notice: 'restaurant was successfully updated.' }
	        format.json { head :no_content }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
	      end
	    end
	  end
	
	  def destroy
	  	@restaurant = Restaurant.find(params[:id])
	  	@restaurant.destroy
	
	    respond_to do |format|
	      format.html { redirect_to restaurants_url }
	      format.json { head :no_content }
	    end
	  end
	
	  def restaurant_params
	  	params.require(:restaurant).permit(:name, :category, :seats, :price, :picture, :address, :ratings)
	  end
	  
end
