Diggable.Views.SearchBar = Backbone.View.extend({
  initialize: function(options) {
    this.mapView = options.mapView;
    this.filterConditions = options.filterConditions;
    this.geocoder = new google.maps.Geocoder();
  },

  events: {
    'submit .location': 'locationSearch'
  },

  template: JST['search/search_bar'],

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  locationSearch: function(event) {
    event.preventDefault();
    var location = $('.city-state-zip').val();

    this.geocoder.geocode({
      address: location,
      region: 'us'
    }, function (response) {
      if (response.length !== 0) {
        var myLatLng = response[0].geometry.location;
        this.mapView._map.panTo(myLatLng);
      } // else {
      // Bootstrap tooltip--"We can't find that spot on the map"
      // with setTimeout to take it off the page
      // }
    }.bind(this));
  }
});
