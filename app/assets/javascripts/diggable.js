window.Diggable = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Diggable.Routers.Router({
      $rootEl: $("div.container")
    });
    
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Diggable.initialize();
});
