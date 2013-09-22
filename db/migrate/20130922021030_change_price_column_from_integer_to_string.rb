class ChangePriceColumnFromIntegerToString < ActiveRecord::Migration
  def change
  	change_column :restaurants, :price, :string 
  end
end
