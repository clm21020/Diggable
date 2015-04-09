Diggable.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.$rootEl = options.$rootEl;
    this.listings = new Diggable.Collections.Listings();
  },

  routes: {
    "": "listingsIndex",
    "listings/new": "listingsNew",
    "listings/:id": "listingsShow"
  },

  listingsIndex: function() {
  },

  listingsNew: function() {
  },

  listingsShow: function(id) {
  },

  _swapView: function(view) {
    if (this.currentView !== undefined){
      this.currentView.remove();
    }
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
