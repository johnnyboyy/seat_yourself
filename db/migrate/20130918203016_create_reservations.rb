class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.string :username
    	t.integer :groupsize
    	t.string :restaurant
    	t.string :address

      t.timestamps
    end
  end
end
