class ReservationsController < ApplicationController


	def show
		@reservation = Reservation.find(params[:id])
	end

	def new
		@restaurant = @restaurant.reservations.build(params[:restaurant_id])
		@reservation = Reservation.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = @restaurant.reservations.create(reservation_params)
		@reservation.user_id = current_user.id

		if @reservation.save
			redirect_to reservation_path notice: 'Reservation created successfully'
		else
			render 'new'
		end
	end



	private


	def reservation_params
		params.require(:reservation).permit(:reservation_name, :groupsize)
	end
end
