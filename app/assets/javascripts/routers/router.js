Diggable.Routers.Router = Backbone.Router.extend({
  initialize: function(options){
    this.$rootEl = options.$rootEl;
    this.listings = new Diggable.Collections.Listings();
    this.listings.fetch();
  },

  routes: {
    "": "search",
  },

  search: function() {
    this.listings.fetch();
    var view = new Diggable.Views.SearchShow({
      collection: this.listings
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
