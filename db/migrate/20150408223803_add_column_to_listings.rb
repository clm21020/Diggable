class AddColumnToListings < ActiveRecord::Migration
  def change
    add_column :listings, :poster_id, :integer, {null: false}
  end
end
