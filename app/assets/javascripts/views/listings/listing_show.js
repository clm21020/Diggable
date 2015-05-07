Diggable.Views.ListingShow = Backbone.View.extend({
  events: {
    "click .hide-details": "hide",
  },

  template: JST["listings/show"],

  render: function(){
    this.$el = $("div.listing-details");
    this.delegateEvents();
    $('.search-bar').click(this.hide.bind(this));
    $('.map').mousedown(this.hide.bind(this));
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
