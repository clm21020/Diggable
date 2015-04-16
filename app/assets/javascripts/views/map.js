Diggable.Views.Map = Backbone.View.extend({
  initialize: function(options){
    this.listingShowView = options.listingShowView;

    var mapOptions = {
      center: { lat: 37.7833, lng: -122.4167 },
      zoom: 14
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
        title: (listing.id).toString()
    });

    google.maps.event.addListener(this._markers[listing.id], "mouseover", function(event, marker){
      this.showMarkerInfo(event, this._markers[listing.id]);
    }.bind(this));

    google.maps.event.addListener(this._markers[listing.id], "click", function(event, marker){
      this.showListingInfo(event, this._markers[listing.id]);
    }.bind(this));
  },

  infoWindowTemplate: JST["map/infoWindow"],

  showMarkerInfo: function(event, marker) {
    if (this._infoWindow) { this._infoWindow.close(); }

    var content = this.infoWindowTemplate({
      listing: this.collection.get(marker.title)
    });

    this._infoWindow = new google.maps.InfoWindow({ content: content });
    this._infoWindow.open(this._map, marker);
  },

  showListingInfo: function(event, marker) {
    var listing = this.collection.get(marker.title);

    if (this.listingShowView.model !== listing) {
      this.listingShowView.model = listing;
      this.listingShowView.render();
    }
    this.listingShowView.show();
  },

  removeMarker: function(listing) {
    // remove the listeners from the marker
    // google.maps.event.clearInstanceListeners(this._markers[listing.id]);
    // remove the marker from the map
    // this._markers[listing.id].setMap(null);
    // delete the marker
    // this._markers[listing.id] = null;
  }
});
