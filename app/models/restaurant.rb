class Restaurant < ActiveRecord::Base

	has_many :reservations
	has_many :users, through: :reservations
	attr_accessor :available_seats



	def reserve_seats
		seats - self.reservations.inject(0) {
		 |sum, r| sum += r.groupsize
		}
	end
	

end
