class AddOwnerColumnToUserTable < ActiveRecord::Migration
  def change
  	add_column :users, :restaurant_owner, :boolean, default: false
  	add_column :restaurants, :owner_id, :integer
  end
end
