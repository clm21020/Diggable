Diggable.Views.ListingShow = Backbone.View.extend({
  initialize: function(){
    this.listen_to(this.model, "sync", this.render);
  },

  template: JST["listings/show"],

  render: function(){
    var content = this.template({
      listing: this.model
    });
    this.$el.html(content);
    return this;
  }
});
