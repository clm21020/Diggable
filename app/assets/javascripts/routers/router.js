Diggable.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.$rootEl = options.$rootEl;
    this.listings = new Diggable.Collections.Listings();
    this.listings.fetch();
  },

  routes: {
    "": "search",
    "listings/:id": "show"
  },

  search: function() {
    this.listings.fetch();
    var view = new Diggable.Views.SearchShow({
      collection: this.listings
    });
    this._swapView(view);
  },

  show: function(id) {
    var listing = this.listings.get_or_fetch(id);
    var view = new Diggable.Views.ListingShow({
      model: listing
    });
    this._swapView(view);
  },

  _swapView: function(view) {
    if (this.currentView !== undefined){
      this.currentView.remove();
    }
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
