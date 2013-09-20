class ReservationsController < ApplicationController
before_filter :get_restaurant

	def show
		@reservation = Reservation.find(params[:id])
	end

	def new
		@reservation = Reservation.new
		@reservation.restaurant_id = params[:restaurant_id]
	end

	def create
		@reservation = @restaurant.reservations.create(reservation_params)
		@reservation.user_id = current_user.id

		if @reservation.save
			redirect_to reservation_path notice: 'Reservation created successfully'
		else
			render 'new'
		end
	end



	private

	def get_restaurant 
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

	def reservation_params
		params.require(:reservation).permit(:reservation_name, :groupsize)
	end
end
