class ReservationsController < ApplicationController
before_action :get_restaurant

	def show
	end

	def new
		@reservation = Reservation.new
		@reservation.restaurant_id = params[:restaurant_id]
	end

	def edit
		@reservation = Reservation.find(params[:id])
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

	def update
		@reservation = Reservation.find(params[:id])
		@reservation.update(reservation_params)
		redirect_to @reservation.restaurant, notice: "reservation updated"
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
