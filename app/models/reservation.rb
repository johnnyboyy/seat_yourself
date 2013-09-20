class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	validates :restaurant_id, uniqueness: true

end
