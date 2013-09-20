class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant

	validates :user_id, uniqueness: true

end
