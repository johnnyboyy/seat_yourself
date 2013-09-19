class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :reservations
  has_many :restaurants, through: :reservations
end
