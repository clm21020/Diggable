class RenameColumnInListings < ActiveRecord::Migration
  def change
    rename_column :listings, :type, :category
  end
end
