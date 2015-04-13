Diggable.Views.Map = Backbone.View.extend({
  initialize: function(){
    var mapOptions = {
      center: { lat: 37.7833, lng: -122.4167 },
      zoom: 12
    };

    this._markers = {};

    this._map = new google.maps.Map(this.el, mapOptions);
    this.collection.each(this.addMarker);

    this.listenTo(this.collection, 'add', this.addMarker);
    this.listenTo(this.collection, 'remove', this.removeMarker);
  },

  attributes: {
    id: 'map-canvas'
  },

  render: function() {
    return this;
  },

  addMarker: function(listing) {
    this._markers[listing.id] = new google.maps.Marker({
        position: { lat: listing.get('latitude'), lng: listing.get('longitude') },
        map: this._map,
        title:"Hello World!"
    });
  },

  removeMarker: function(listing) {
    this._markers[listing.id].setMap(null);
  }
});
