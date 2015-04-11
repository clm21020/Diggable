Diggable.Views.SearchShow = Backbone.CompositeView.extend({
  // Will contain listings, map, and possibly a search bar
  initialize: function(){
    this.addListingsIndexView();
  },

  template: JST['search/show'],

  render: function(){
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addListingsIndexView: function() {
    var subview = new Diggable.Views.ListingsIndex({collection: this.collection});
    this.addSubview('.listings', subview);
  }
});
