class AddLocationToBorough < ActiveRecord::Migration
  def change
    add_column :boroughs, :location, :string
  end
end
