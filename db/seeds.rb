# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)






# -------Users------------------------------------

User.create({
  username: "guest",
  password: "password"
})

5.times do
  User.create({
    username: Faker::Internet.user_name,
    password: "password"
  })
end


# ---------Listings----------------------------------

RENT_ADDRESSES = {
  app_academy: {
    street_1: "1061 Market St",
    street_2: "#4",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
    description: "App Academy"
  },
  dropbox: {
    street_1: "185 Berry Street",
    city: "San Francisco",
    state: "CA",
    zip_code: "94107",
    description: "Dropbox"
  },
  eventbrite: {
    street_1: "155 5th St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94107",
    description: "Eventbrite"
  },
  indiegogo: {
    street_1: "965 Mission St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
    description: "Indiegogo"
  },
}

BUY_ADDRESSES = {
  newrelic: {
    street_1: "188 Spear St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94105",
    description: "New Relic"
  },
  salesforce: {
    street_1: "1 Market St",
    street_2: "#300",
    city: "San Francisco",
    state: "CA",
    zip_code: "94105",
    description: "Salesforce.com"
  },
  square: {
    street_1: "1455 Market St",
    street_2: "#600",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
    description: "Square"
  },
  twitter: {
    street_1: "1355 Market St",
    street_2: "#900",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
    description: "Twitter"
  },
  yelp: {
    street_1: "140 New Montgomery St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94105",
    description: "Yelp"
  }
}

# Probable Future Additions
# Facebook (Menlo Park)
# NetApp (sunnyvale)
# SurveyMonkey (PA)
#
# Google (MV)
# Intuit (MV)
# LinkedIn (MV)
# Tubular (MV)
#
# Apple (cupertino)
# ebay (san jose)
# Intel (santa clara)

# to rent
RENT_ADDRESSES.each do |key, val|
  listing = Listing.create({
    price: (Faker::Number.number(1).to_i * 100),
    category: "rent",
    poster_id: Faker::Number.between(1, 6),
    available_at: Faker::Date.between(1.week.ago, 3.weeks.from_now)
  }.merge(val))
end

# to buy
BUY_ADDRESSES.each do |key, val|
  listing = Listing.create({
    price: (Faker::Number.number(3).to_i * 1000),
    category: "buy",
    poster_id: Faker::Number.between(1, 6),
    available_at: Faker::Date.between(1.week.ago, 3.weeks.from_now)
  }.merge(val))
end
