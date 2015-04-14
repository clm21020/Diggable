Diggable.Views.ListingShow = Backbone.View.extend({
  events: {
    "click .hide-details": "hide",
  },

  template: JST["listings/show"],

  render: function(){
    this.$el = $("div.listing-details");
    this.delegateEvents();
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
