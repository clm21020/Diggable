Diggable.Views.SearchBar = Backbone.View.extend({
  initialize: function(options) {
    this.mapView = options.mapView;
    this.filterConditions = options.filterConditions;
    this.geocoder = new google.maps.Geocoder();
  },

  events: {
    'submit .location': 'locationSearch',
    'click .current-price-range': 'togglePriceForm',
    'click .listing-type-button': 'toggleListingTypeForm',
    'keypress input.min-price': 'handleKeypress',
    'keypress input.max-price': 'handleKeypress',
    'click .price-container': 'stopPropagation'
  },

  template: JST['search/search_bar'],

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  stopPropagation: function(event){
    event.stopPropagation();
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
  },

  handleKeypress: function(event) {
    if (event.charCode === 13 && event.currentTarget.className === "min-price") {
      $('input.max-price').focus();
    } else if (event.charCode === 13 && event.currentTarget.className === "max-price") {
      this.togglePriceForm(event);
    }
  },

  togglePriceForm: function(event) {
    event.stopPropagation();
    var form = $('form.price');

    $('form.price').toggleClass('out-of-sight');

    if (form.hasClass('out-of-sight')){
      this.closePriceForm(event);
      this.updatePriceFilter();
      $('html').off('click', this.closePriceForm.bind(this));
    } else {
      this.delegateEvents();
      $('html').click(this.closePriceForm.bind(this));
      $('input.min-price').focus();
    }
  },

  closePriceForm: function(event) {
    $('form.price').addClass('out-of-sight');
    this.updatePriceFilter();
  },

  updatePriceFilter: function() {
    var minPrice = parseInt($('.min-price').val());
    var maxPrice = parseInt($('.max-price').val());

    var priceBounds = this.filterConditions.price || {};

    if (isNaN(minPrice) || (minPrice === 0)) {
      delete priceBounds.min_price;
      $('.min-price').val('');
    } else {
      priceBounds.min_price = minPrice;
      $('.min-price').val(minPrice);
    }

    if (isNaN(maxPrice) || (maxPrice === 0)) {
      delete priceBounds.max_price;
      $('.max-price').val('');
    } else {
      priceBounds.max_price = maxPrice;
      $('.max-price').val(maxPrice);
    }

    this.filterConditions.price = priceBounds;
    this.updateCurrentPriceRange();
    this.collection.fetch({
      data: this.filterConditions
    });
  },

  updateCurrentPriceRange: function() {
    var minPresent = (this.filterConditions.price.min_price !== undefined);
    var maxPresent = (this.filterConditions.price.max_price !== undefined);
    var newVal = 'Any Price';

    if (minPresent && maxPresent) {
      newVal = '$' + this.filterConditions.price.min_price;
      newVal += ' - $' + this.filterConditions.price.max_price;
    } else if (minPresent && !maxPresent) {
      newVal = '$' + this.filterConditions.price.min_price + "+";
    } else if (maxPresent && !minPresent) {
      newVal = '$0 - $' + this.filterConditions.price.max_price;
    }

    $('.current-price-range').html(newVal);
  },

  toggleListingTypeForm: function(event) {
    event.stopPropagation();
    var form = $('form.listing-type');

    form.toggleClass('out-of-sight');
  },

});
