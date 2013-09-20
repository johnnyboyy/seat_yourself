require 'spec_helper'

describe Reservation do
	it "should not allow a user to make two reservations on the same restaurant" do
		res1 = Reservation.new(reservation_name: "test",
											groupsize: 12,
											user_id: 1,
											restaurant_id: 1)
		res2 = Reservation.new(reservation_name: "test",
											groupsize: 12,
											user_id: 1,
											restaurant_id: 1)
		res1.save

		expect(res2.save).to be_false
	end	

	it "should allow a user to make a reservation on many different restaurants" do

		res1 = Reservation.new(reservation_name: "test",
											groupsize: 12,
											user_id: 1,
											restaurant_id: 1)
		res3 = Reservation.new(reservation_name: "test",
											groupsize: 12,
											user_id: 1,
											restaurant_id: 2)
		res1.save

		expect(res3.save).to be_true

	end
end
