class ChangeCategoryToListingType < ActiveRecord::Migration
  def change
    rename_column(:listings, :category, :listing_type)    
  end
end
