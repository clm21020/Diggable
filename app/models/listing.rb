# == Schema Information
#
# Table name: listings
#
#  id           :integer          not null, primary key
#  price        :integer          not null
#  latitude     :string
#  longitude    :string
#  category     :string
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
#

class Listing < ActiveRecord::Base
  validates :price, :type, :street_1, :city, :state, :zip_code, :description,
              :available_at, :poster_id, presence: true

  belongs_to :poster, class_name: "User"

  def self.search_results(options={})
    results = Listing.all

    # for each option, filter with an ugly where condition (decompose)
    #   filter by range, and sort inclusive/exclusive
    # category & price--will need to be considered together
    #   buy: filter by price if mortgage is specified (buy only)
    #        filter by price * % if 'approximate monthly mortgage' is specified (buy&rent)
    #   rent: filter by price (rent only OR buy&rent)
    # latitude and longitude will need to wrap (refer back to the demo)
    # available_at should take a range
    # price should take a range

    results
  end

  def address_string
    street = self.street_2 ? "#{self.street_1}, #{self.street_2}" : self.street_1
    "#{street}, #{self.city}, #{self.state} #{self.zip_code}"
  end
end
