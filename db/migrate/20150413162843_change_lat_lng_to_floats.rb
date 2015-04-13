class ChangeLatLngToFloats < ActiveRecord::Migration
  def change
    remove_column(:listings, :latitude)
    remove_column(:listings, :longitude)
    add_column(:listings, :latitude, :float)
    add_column(:listings, :longitude, :float)
  end
end
