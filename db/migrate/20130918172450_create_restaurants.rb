class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
    	t.string :name
    	t.string :category
    	t.integer :seats
    	t.integer :price

      t.timestamps
    end
  end
end
