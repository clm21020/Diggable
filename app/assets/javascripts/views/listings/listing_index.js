Diggable.Views.ListingsIndex = Backbone.CompositeView.extend({
  initialize: function(options) {
    this.showView = options.showView;
    this.mapView = options.mapView;
    this.collection.each(this.addListingIndexItemView);
    this.listenTo(this.collection, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.addListingIndexItemView);
    this.listenTo(this.collection, 'remove', this.removeListingIndexItemView);
  },

  template: JST['listings/index'],

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addListingIndexItemView: function(listing) {
    var subview = new Diggable.Views.ListingIndexItem({
      model: listing,
      mapView: this.mapView,
      showView: this.showView
    });
    this.addSubview('.listing-index-items', subview);
  },

  removeListingIndexItemView: function(listing) {
    var subviews = this.subviews('.listing-index-items');
    var i = _(subviews).findIndex(function (el) {
      return el.model === listing;
    });
    subviews[i].remove();
    subviews.splice(i, 1);
  }
});
