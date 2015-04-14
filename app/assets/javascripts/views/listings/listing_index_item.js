Diggable.Views.ListingIndexItem = Backbone.View.extend({
  initialize: function(options){
    this.mapView = options.mapView;
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    "mouseenter": "displayInfo",
  },

  template: JST['listings/index_item'],

  className: 'listing-index-item',

  render: function(){
    var content = this.template({ listing: this.model });
    this.$el.html(content);
    return this;
  },

  displayInfo: function(event) {
    var marker = this.mapView._markers[this.model.id];
    this.mapView.showMarkerInfo(event, marker);
  }
});
