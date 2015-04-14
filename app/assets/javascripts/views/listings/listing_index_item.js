Diggable.Views.ListingIndexItem = Backbone.View.extend({
  initialize: function(options){
    this.mapView = options.mapView;
    this.showView = options.showView;
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    "mouseenter": "displayMarkerInfo",
    "click": "displayShowView"
  },

  template: JST['listings/index_item'],

  className: 'listing-index-item',

  render: function(){
    var content = this.template({ listing: this.model });
    this.$el.html(content);
    return this;
  },

  displayMarkerInfo: function(event) {
    var marker = this.mapView._markers[this.model.id];
    this.mapView.showMarkerInfo(event, marker);
  },

  displayShowView: function(event) {
    if (this.showView.model !== this.model) {
      this.showView.model = this.model;
      this.showView.render();
    }
    this.showView.show();
  }
});
