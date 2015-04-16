Diggable.Views.SearchShow = Backbone.CompositeView.extend({
  // Will contain listings, map, and possibly a search bar
  initialize: function(){
    this.filterConditions = {};
    this.listingShowView = new Diggable.Views.ListingShow();
    this.addMapView();
    this.addListingsIndexView();
    this.addSearchBarView();
  },

  template: JST['search/show'],

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addListingsIndexView: function() {
    var subview = new Diggable.Views.ListingsIndex({
      collection: this.collection,
      mapView: this._subviews['.map'][0],
      showView: this.listingShowView
    });
    this.addSubview('.listings', subview);
  },

  addMapView: function() {
    var subview = new Diggable.Views.Map({
      collection: this.collection,
      listingShowView: this.listingShowView,
      filterConditions: this.filterConditions
    });
    this.addSubview('.map', subview);
  },

  addSearchBarView: function() {
    var subview = new Diggable.Views.SearchBar({
      collection: this.collection,
      mapView: this._subviews['.map'][0],
      filterConditions: this.filterConditions
    });
    this.addSubview('.search-bar', subview);
  }
});
