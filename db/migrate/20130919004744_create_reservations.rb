class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.string :reservation_name
    	t.references :user
    	t.references :restaurant

      t.timestamps
    end
  end
end
