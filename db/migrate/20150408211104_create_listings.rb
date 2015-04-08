class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :price, null: false

      t.string :latitude
      t.string :longitude
      t.string :type

      t.string :street_1, null: false
      t.string :street_2
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.text :description, null: false

      t.datetime :available_at, null: false
      t.timestamps null: false
    end

    add_index :listings, :price
    add_index :listings, :available_at
    add_index :listings, :latitude
    add_index :listings, :longitude
    add_index :listings, :type
  end
end
