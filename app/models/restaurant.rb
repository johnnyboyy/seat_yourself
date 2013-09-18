class Restaurant < ActiveRecord::Base

attr_accessor :available_seats
has_many :reservations
has_many :users, through: :reservations

	def reserve_seats
		seats - self.reservations.inject(0) {|sum, r| sum += r.groupsize }
	end

end
