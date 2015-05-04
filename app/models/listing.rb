# == Schema Information
#
# Table name: listings
#
#  id           :integer          not null, primary key
#  price        :integer          not null
#  listing_type :string
#  street_1     :string           not null
#  street_2     :string
#  city         :string           not null
#  state        :string           not null
#  zip_code     :string           not null
#  description  :text             not null
#  available_at :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  poster_id    :integer          not null
#  latitude     :float
#  longitude    :float
#  main_picture :string
#

class Listing < ActiveRecord::Base
  validates :price, :listing_type, :street_1, :city, :state, :zip_code, :description,
              :available_at, :poster_id, presence: true

  belongs_to :poster, class_name: "User"

  geocoded_by :address
  before_validation :geocode

  def self.search_results(options={})
    results = Listing.all

    if options[:listing_type]
      results = filter_by_listing_type(options[:listing_type], results)
    end

    if options[:location]
      results = filter_by_location(options[:location], results)
    end

    if options[:price]
      results = filter_by_price(options[:price], results)
    end

    results
  end

  def self.filter_by_listing_type(filter, ar_relation)
    if filter == "both"
      ar_relation
    else
      ar_relation.where(listing_type: filter)
    end
  end

  def self.filter_by_location(filters, ar_relation)
    ar = ar_relation.where(latitude: (filters[:lat_min]..filters[:lat_max]))
    ar.where(longitude: (filters[:lng_min]..filters[:lng_max]))
  end

  def self.filter_by_price(filters, ar_relation)
    ar = ar_relation
    if filters[:min_price]
      ar = ar.where("price >= ?", filters[:min_price])
    end
    if filters[:max_price]
      ar = ar.where("price <= ?", filters[:max_price])
    end
    ar
  end

  def address
    sleep(0.2)
    street = self.street_2 ? "#{self.street_1}, #{self.street_2}" : self.street_1
    "#{street}, #{self.city}, #{self.state} #{self.zip_code}"
  end
end
