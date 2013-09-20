require 'spec_helper'

describe Reservation do

	let(:res1) {Reservation.new(reservation_name: "test",
							groupsize: 12,
							user_id: 1,
							restaurant_id: 1)
						}
	let(:res2) {Reservation.new(reservation_name: "test",
							groupsize: 12,
							user_id: 1,
							restaurant_id: 1)
						}
	let(:res3) {Reservation.new(reservation_name: "test",
							groupsize: 12,
							user_id: 1,
							restaurant_id: 2)
						}
	let(:rest) {Restaurant.new(name: "test",
							category: "test",
							seats: 1,
							price: 15,
							picture_url: "blank.jpg",
							address: "test",
							ratings: 3)
						}								

	it "should not allow a user to make two reservations on the same restaurant" do
		res1.save

		expect(res2.save).to be_false
	end	

	it "should allow a user to make a reservation on many different restaurants" do
		res1.save

		expect(res3.save).to be_true

	end

	it "should not be able to reserve more seats than are available" do

		rest.save

		expect(res1.save).to be_false
	end
end
