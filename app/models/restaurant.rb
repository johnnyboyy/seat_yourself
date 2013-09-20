class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, through: :reservations



	def available_seats
		self.seats - self.reservations.inject(0) {
		 |sum, r| sum += r.groupsize
		}
	end

	

end
