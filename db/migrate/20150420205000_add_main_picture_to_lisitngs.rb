class AddMainPictureToLisitngs < ActiveRecord::Migration
  def change
    add_column :listings, :main_picture, :string
  end
end
