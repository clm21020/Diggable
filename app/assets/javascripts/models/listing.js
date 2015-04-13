Diggable.Models.Listing = Backbone.Model.extend({
  urlRoot: "/api/listings",

  prettyAddress: function(){
    var address = this.escape('street_1');
    if ( this.get('street_2') !== null ) {
      address += ' ' + this.escape('street_2');
    }
    address += ', ' + this.escape('city');
    address += ', ' + this.escape('state');
    address += ' ' + this.escape('zip_code');
    return address;
  },

  shortAddress: function(len){
    return this.prettyAddress().substr(0, len);
  },

  commaPrice: function(price){
    var digits = price.split('');

    var nextComma = -3;
    while (nextComma > (0 - digits.length)) {
      digits.splice(nextComma, 0, ',');
      nextComma -= 4;
    }

    return digits.join('');
  },

  prettyPrice: function(){
    var price = "$" + this.commaPrice(this.escape('price'));
    if ( this.get('category') === "rent" ) {
      price += "/mo";
    }
    return price;
  }
});
