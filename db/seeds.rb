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

ADDRESSES = {
  app_academy: {
    street_1: "1061 Market St",
    street_2: "#4",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
  },
  indiegogo: {
    street_1: "965 Mission St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
  },
  salesforce: {
    street_1: "1 Market St",
    street_2: "#300",
    city: "San Francisco",
    state: "CA",
    zip_code: "94105",
  },
  square: {
    street_1: "1455 Market St",
    street_2: "#600",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
  },
  twitter: {
    street_1: "1355 Market St",
    street_2: "#900",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
  },
  yelp: {
    street_1: "140 New Montgomery St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94105",
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

ADDRESSES.each do |key, val|
  listing = Listing.create({
    price: (Faker::Number.number(1).to_i * 100),
    category: "rent",
    description: "It's a nice place",
    poster_id: Faker::Number.between(1, 6),
    available_at: Faker::Date.between(1.week.ago, 3.weeks.from_now)
  }.merge(val))
  # generate lat/long ? maybe do that in after_initialize in model
end


# to buy
3.times do
  Listing.create({
  price: (Faker::Number.number(3).to_i * 1000),
  category: "buy",
  street_1: Faker::Address.street_address,
  city: "San Francisco",
  state: "CA",
  zip_code: "94103",
  description: "Hidden Gem",
  poster_id: 1,
  available_at: Faker::Date.between(1.week.ago, 3.weeks.from_now)
})
end
