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
#

class Listing < ActiveRecord::Base
  validates :price, :type, :street_1, :city, :state, :zip_code, :description,
              :available_at, presence: true

  def address_string
    street = self.street_2 ? "#{self.street_1}, #{self.street_2}" : self.street_1
    "#{street}, #{self.city}, #{self.state} #{self.zip_code}"
  end
end
