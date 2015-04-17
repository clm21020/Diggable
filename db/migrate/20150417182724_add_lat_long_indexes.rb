class AddLatLongIndexes < ActiveRecord::Migration
  def change
    add_index :listings, :latitude
    add_index :listings, :longitude
  end
end
