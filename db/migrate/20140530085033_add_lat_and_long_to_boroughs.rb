class AddLatAndLongToBoroughs < ActiveRecord::Migration
  def change
    add_column :boroughs, :latitude, :float
    add_column :boroughs, :longitude, :float
    add_column :boroughs, :location, :string
  end
end
