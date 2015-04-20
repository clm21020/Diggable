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
    "http://www.topdreamer.com/wp-content/uploads/2013/09/dog-house-image-04.jpg",
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
    "http://img.designswan.com/2009/lifeDesign/dogHouse/2.jpg",
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
