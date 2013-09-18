class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
    	t.string :name
    	t.string :category
    	t.integer :seats
    	t.integer :price
    	t.string :picture_url
    	t.string :address
    	t.integer :ratings

      t.timestamps
    end
  end
end
