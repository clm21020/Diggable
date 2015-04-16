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
#

class Listing < ActiveRecord::Base
  validates :price, :listing_type, :street_1, :city, :state, :zip_code, :description,
              :available_at, :poster_id, presence: true

  belongs_to :poster, class_name: "User"

  geocoded_by :address
  before_validation :geocode

  # LIMIT API REQUESTS (if needed)
  #  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  #
  # def address_attributes
  #   [:street_1, :street_2, :city, :state, :zip_code]
  # end
  #
  # address_attributes.any? { |attr| self.send("#{attr}_present?") && self.send("#{attr}_changed?") }

  def self.search_results(options={})
    results = Listing.all

    if options[:location]
      results = filter_by_location(options[:location], results)
    end

    # for each option, filter with an ugly where condition (decompose)
    #   filter by range, and sort inclusive/exclusive
    # listing_type & price--will need to be considered together
    #   buy: filter by price if mortgage is specified (buy only)
    #        filter by price * % if 'approximate monthly mortgage' is specified (buy&rent)
    #   rent: filter by price (rent only OR buy&rent)
    # available_at should take a range
    # price should take a range

    results
  end

  def self.filter_by_location(filters, ar_relation)
    # potential bonus feature: allow latitude and longitude to wrap
    ar = ar_relation.where(latitude: (filters[:lat_min]..filters[:lat_max]))
    ar.where(longitude: (filters[:lng_min]..filters[:lng_max]))
  end

  def address
    sleep(0.2)
    street = self.street_2 ? "#{self.street_1}, #{self.street_2}" : self.street_1
    "#{street}, #{self.city}, #{self.state} #{self.zip_code}"
  end
end
