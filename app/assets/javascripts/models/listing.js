Diggable.Models.Listing = Backbone.Model.extend({
  urlRoot: "/api/listings",

  available: function() {
    var monthNames = [
        "Jan", "Feb", "Mar", "Apr", "May", "June", "July",
        "Aug", "Sep", "Oct", "Nov", "Dec"
    ];

    var uglyDate = this.get('available_at');
    var year = uglyDate.slice(0, 4);
    var month = parseInt(uglyDate.slice(5, 7));
    var day = parseInt(uglyDate.slice(8, 10));

    return monthNames[month - 1] + " " + day + ", " + year;
  },

  fullStreet: function() {
    if ( this.get('street_2') === null ){
      return this.escape('street_1');
    } else {
      return this.escape('street_1') + ' ' + this.escape('street_2');
    }
  },

  cityStateZip: function() {
    return this.escape('city') + ', ' + this.escape('state') + ' ' + this.escape('zip_code');
  },

  prettyAddress: function() {
    return this.fullStreet() + ', ' + this.cityStateZip();
  },

  shortAddress: function(len) {
    return this.prettyAddress().substr(0, len);
  },

  commaPrice: function(price) {
    var digits = price.split('');

    var nextComma = -3;
    while (nextComma > (0 - digits.length)) {
      digits.splice(nextComma, 0, ',');
      nextComma -= 4;
    }

    return digits.join('');
  },

  prettyPrice: function() {
    var price = "$" + this.commaPrice(this.escape('price'));
    if ( this.get('listing_type') === "rent" ) {
      price += "/mo";
    }
    return price;
  }
});
