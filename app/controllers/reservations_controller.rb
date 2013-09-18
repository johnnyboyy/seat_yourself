class ReservationsController < ApplicationController

	def show
		@reservation = Reservation.find(params[:id])
	
	  respond_to do |format|
	    format.html # show.html.erb
	    format.json { render json: @reservation }
	  end
	end
	
	def new
		@reservation = Reservation.new
	
	  respond_to do |format|
	    format.html # new.html.erb
	    format.json { render json: @reservations }
	  end
	end
	
	def edit
		@reservation = Reservation.find(params[:id])
	end
	
	def create
		@reservation = Reservation.new(reservation_params)
	
	  respond_to do |format|
	    if @reservation.save
	      format.html { redirect_to @reservation, notice: 'reservation was successfully created.' }
	      format.json { render json: @reservation, status: :created, location: @reservation }
	    else
	      format.html { render action: "new" }
	      format.json { render json: @reservation.errors, status: :unprocessable_entity }
	    end
	  end
	end
	
	def update
		@reservation = Reservation.find(params[:id])
	
	  respond_to do |format|
	    if @reservation.update(reservation_params)
	      format.html { redirect_to @reservation, notice: 'reservation was successfully updated.' }
	      format.json { head :no_content }
	    else
	      format.html { render action: "edit" }
	      format.json { render json: @reservation.errors, status: :unprocessable_entity }
	    end
	  end
	end
	
	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
	
	  respond_to do |format|
	    format.html { redirect_to reservations_url }
	    format.json { head :no_content }
	  end
	end
	
	def reservation_params
		params.require(:reservation).permit(:name, :category, :seats, :price, :picture, :address, :ratings)
	end
end
