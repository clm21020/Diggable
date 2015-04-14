Diggable.Views.ListingShow = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },

  className: "listing-details",

  events: {
    "click .hide-details": "hide",
  },

  template: JST["listings/show"],

  render: function(){
    var content = this.template({
      listing: this.model
    });
    this.$el.html(content);
    return this;
  },

  hide: function(){
    this.$el.addClass("out-of-sight");
  },

  show: function(){
    this.$el.removeClass("out-of-sight");
  }
});
