class AddGroupSizeToReservations < ActiveRecord::Migration
  def change
  	add_column :reservations, :groupsize, :integer
  end
end
