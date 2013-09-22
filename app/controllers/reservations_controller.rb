class ReservationsController < ApplicationController
before_filter :get_restaurant

	def show
	end

	def new
		@reservation = Reservation.new
		@reservation.restaurant_id = params[:restaurant_id]
	end

	def create
		@reservation = @restaurant.reservations.create(reservation_params)
		@reservation.user_id = current_user.id
		
		if @reservation.groupsize > @restaurant.available_seats
			render 'new', alert: "There aren't enough seats left for party size!"
		elsif @reservation.save
			redirect_to @restaurant, notice: 'Reservation created successfully'
		else
			render 'new'
		end
	end



	private

	def get_restaurant 
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

	def reservation_params
		params.require(:reservation).permit(:reservation_name, :groupsize, :updated_at)
	end
end
