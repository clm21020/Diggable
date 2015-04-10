Diggable.Views.ListingIndexItem = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model, 'sync', this.render);
  },

  template: JST['listings/index_item'],

  render: function(){
    var content = this.template({ listing: this.model });
    this.$el.html(content);
    return this;
  }
});
