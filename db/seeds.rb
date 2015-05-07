# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

module Photo
  PHOTO_URLS = [
    "https://s-media-cache-ak0.pinimg.com/236x/eb/e8/43/ebe843bb91ebb918e6baae14e4b40742.jpg",
    "http://www.thecoolist.com/wp-content/uploads/2010/03/celebrity-hacienda-dog-house.jpg",
    "https://s-media-cache-ak0.pinimg.com/originals/44/53/87/445387b6b1a259ab94e01760737fc91b.jpg",
    "http://www.guidinghome.com/wp-content/uploads/2013/07/dog-house-2.jpg",
    "http://cdn.sheknows.com/articles/2011/12/dog-cubix-mansion.jpg",
    "http://www.everybodysucksbutus.com/wp-content/uploads/2008/07/luxury-dog-house-5.jpg",
    "https://s-media-cache-ak0.pinimg.com/736x/39/0a/b6/390ab65793892bdd6c94d102866f0664.jpg",
    "https://s-media-cache-ak0.pinimg.com/736x/e5/3f/27/e53f27a5de1b5d44fb7af2e7312c5c66.jpg",
    "https://s-media-cache-ak0.pinimg.com/236x/a6/a5/87/a6a587bb57f379c9ed5bc6d95ba4236d.jpg",
    "http://patscolor.com/wp-content/uploads/2014/11/contemporary-moden-and-awesome-dog-house.png",
    "http://static.boredpanda.com/blog/wp-content/uuuploads/furniture-design-for-pet-lovers/furniture-design-for-pet-lovers-4.jpg",
    "http://st.houzz.com/simgs/a6e14c450d06bd8d_8-1000/contemporary-landscape.jpg",
    "http://www.petco.com/assets/product_images/4/4011905394718C.jpg",
    "http://1.lushome.com/wp-content/uploads/2011/02/wooden-dog-house-design-outdoor-dogs-pets.gif",
    "http://doghousepictures.org/large/27/Wood-Dog-Houses-Pictures-5.jpg",
    "http://www.petstrends.com/wp-content/uploads/dog-house-prefab.jpg",
    "http://www.jetsongreen.com/images/old/6a00d8341c67ce53ef0120a53f7f2a970b-800wi.jpg",
    "http://bark-meow.com/wp-content/uploads/2014/03/english-cottage.jpg",
    "http://hgdiy.com/files/2014/01/Log-Cabin-Luxury-Doghouse.jpg",
    "http://www.ballerhouse.com/wp-content/uploads/2008/02/dogmansion3.jpg",
    "http://npic-hmit2009.org/wp-content/uploads/2015/03/dog-house-porch-114284.jpg",
    "http://p-fst1.pixstatic.com/51bd6265dbd0cb3f900003fd._w.540_s.fit_.JPEG",
    "http://2.lushome.com/wp-content/uploads/2012/08/backyard-ideas-dog-house-decoration-16.jpg",
    "https://s-media-cache-ak0.pinimg.com/736x/17/08/01/17080172e1ccfa9c08de3b041c992011.jpg",
    "http://www.greenroofs.com/blog/wp-content/uploads/2009/02/barkitecture1.jpg",
    "http://i0.wp.com/2.bp.blogspot.com/-F8Kk0oSMzx8/T8qY2ib3j7I/AAAAAAACV98/ge85pOshQXI/s640/Balance%2BAssociates%2BArchitecture.jpg?resize=640%2C585",
    "http://blog.urbanwoodgoods.com/wp-content/uploads/2013/11/doghose.png"
  ]

  @@photo_index = 0

  def self.photo_url
    url = PHOTO_URLS[@@photo_index]
    @@photo_index = (@@photo_index + 1) % PHOTO_URLS.length
    url
  end
end


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
  airbnb: {
    street_1: "888 Brannan St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
    description: "Airbnb"
  },
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
  hellosign: {
    street_1: "944 Market St",
    street_2: "Suite 400",
    city: "San Francisco",
    state: "CA",
    zip_code: "94102",
    description: "HelloSign"
  },
  heroku: {
    street_1: "650 7th St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
    description: "Heroku"
  },
  indiegogo: {
    street_1: "965 Mission St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
    description: "Indiegogo"
  },
  lyft: {
    street_1: "2300 Harrison St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94110",
    description: "Lyft"
  },
  newrelic: {
    street_1: "188 Spear St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94105",
    description: "New Relic"
  },
}

BUY_ADDRESSES = {
  pinterest: {
    street_1: "808 Brannan St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
    description: "Pinterest"
  },
  pivotal_labs: {
    street_1: "875 Howard St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
    description: "Pivotal Labs"
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
  stripe: {
    street_1: "3180 18th St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94110",
    description: "Stripe"
  },
  taskrabbit: {
    street_1: "425 2nd St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94107",
    description: "TaskRabbit"
  },
  thoughtbot: {
    street_1: "85 2nd St",
    street_2: "#700",
    city: "San Francisco",
    state: "CA",
    zip_code: "94105",
    description: "thoughtbot"
  },
  twitter: {
    street_1: "1355 Market St",
    street_2: "#900",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
    description: "Twitter"
  },
  uber: {
    street_1: "1455 Market St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94103",
    description: "Uber"
  },
  yelp: {
    street_1: "140 New Montgomery St",
    city: "San Francisco",
    state: "CA",
    zip_code: "94105",
    description: "Yelp"
  }
}

# south of SF--separated to avoid using the same picture in listings that would be close together
MORE_RENT_ADDRESSES = {
  gopro: {
    street_1: "3000 Clearview Way",
    city: "San Mateo",
    state: "CA",
    zip_code: "94402",
    description: "GoPro"
  },
  groupon: {
    street_1: "3101 Park Blvd",
    city: "Palo Alto",
    state: "CA",
    zip_code: "94306",
    description: "Groupon"
  },
  nest: {
    street_1: "900 Hansen Way",
    city: "Palo Alto",
    state: "CA",
    zip_code: "94304",
    description: "Nest"
  },
  google: {
    street_1: "1600 Amphitheatre Pkwy",
    city: "Mountain View",
    state: "CA",
    zip_code: "94043",
    description: "Google"
  },
  healthloop: {
    street_1: "605 Ellis St",
    street_2: "#100",
    city: "Mountain View",
    state: "CA",
    zip_code: "94043",
    description: "HealthLoop"
  },
  intuit: {
    street_1: "2632 Marine Way",
    city: "Mountain View",
    state: "CA",
    zip_code: "94043",
    description: "Intuit"
  },
  apple: {
    street_1: "1 Infinite Loop",
    city: "Cupertino",
    state: "CA",
    zip_code: "95014",
    description: "Apple"
  },
  adobe: {
    street_1: "345 Park Ave",
    city: "San Jose",
    state: "CA",
    zip_code: "",
    description: "Adobe"
  },
}


MORE_BUY_ADDRESSES = {
  facebook: {
    street_1: "1 Hacker Way",
    city: "Menlo Park",
    state: "CA",
    zip_code: "94025",
    description: "Facebook"
  },
  pebble: {
    street_1: "925 Alma St.",
    city: "Palo Alto",
    state: "CA",
    zip_code: "94301",
    description: "Pebble"
  },
  surveymonkey: {
    street_1: "101 Lytton Ave",
    city: "Palo Alto",
    state: "CA",
    zip_code: "94301",
    description: "SurveyMonkey"
  },
  linkedin: {
    street_1: "2029 Stierlin Ct",
    city: "Mountain View",
    state: "CA",
    zip_code: "94043",
    description: "LinkedIn"
  },
  tubular_labs: {
    street_1: "153 Castro Street",
    city: "Mountain View",
    state: "CA",
    zip_code: "94041",
    description: "Tubular Labs"
  },
  evernote: {
    street_1: "305 Walnut St",
    city: "Redwood City",
    state: "CA",
    zip_code: "94063",
    description: "Evernote"
  },
  ebay: {
    street_1: "2065 Hamilton Ave",
    city: "San Jose",
    state: "CA",
    zip_code: "95125",
    description: "eBay"
  },
  intel: {
    street_1: "2200 Mission College Blvd",
    city: "Santa Clara",
    state: "CA",
    zip_code: "95054",
    description: "Intel"
  },
}


# to rent
RENT_ADDRESSES.each do |key, val|
  listing = Listing.create({
    price: ((Faker::Number.number(1).to_i + 5) * 100),
    listing_type: "rent",
    poster_id: Faker::Number.between(1, 6),
    available_at: Faker::Date.between(1.week.ago, 3.weeks.from_now),
    main_picture: Photo::photo_url
  }.merge(val))
end

# to buy
BUY_ADDRESSES.each do |key, val|
  listing = Listing.create({
    price: (Faker::Number.number(3).to_i * 1000),
    listing_type: "buy",
    poster_id: Faker::Number.between(1, 6),
    available_at: Faker::Date.between(1.week.ago, 3.weeks.from_now),
    main_picture: Photo::photo_url
  }.merge(val))
end

MORE_RENT_ADDRESSES.each do |key, val|
  listing = Listing.create({
    price: ((Faker::Number.number(1).to_i + 5) * 100),
    listing_type: "rent",
    poster_id: Faker::Number.between(1, 6),
    available_at: Faker::Date.between(1.week.ago, 3.weeks.from_now),
    main_picture: Photo::photo_url
  }.merge(val))
end

MORE_BUY_ADDRESSES.each do |key, val|
  listing = Listing.create({
    price: (Faker::Number.number(3).to_i * 1000),
    listing_type: "buy",
    poster_id: Faker::Number.between(1, 6),
    available_at: Faker::Date.between(1.week.ago, 3.weeks.from_now),
    main_picture: Photo::photo_url
  }.merge(val))
end
