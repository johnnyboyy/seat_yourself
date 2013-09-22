class Reservation < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	belongs_to :restaurant, dependent: :destroy

	validates :user_id, uniqueness: true

end
