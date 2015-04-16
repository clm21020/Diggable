window.Diggable = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Diggable.Routers.Router({
      $rootEl: $("div.content")
    });

    Backbone.history.start();
  }
};
