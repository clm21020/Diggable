Diggable.Collections.Listings = Backbone.Collection.extend({
  url: "/api/listings",

  model: Diggable.Models.Listing,

  get_or_fetch: function(id) {
    var collection = this;
    var listing = collection.get(id);

    if (listing) {
      listing.fetch();
    } else {
      listing = new collection.model({ id: id });
      listing.fetch({
        success: function(){
          collection.add(listing);
        }
      });
    }

    return listing;
  }
});
