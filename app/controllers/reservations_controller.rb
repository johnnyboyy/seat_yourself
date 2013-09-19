class ReservationsController < ApplicationController

	def show
		@reservation = Reservation.find(parms[:id])
	end

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.create(reservation_params)
		@reservation.user_id = current_user.id

		if @reservation.save
			redirect_to @reservation
		else
			render 'new'
		end


	end



	private


	def reservation_params
		params.require(:reservation).permit(:reservation_name)
	end
end
