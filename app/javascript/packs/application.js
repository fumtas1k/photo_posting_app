require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "bootstrap";
import "../stylesheets/application";

$(document).on('turbolinks:load', function() {
  $("#mini-menu-wrapper").hide();
  $("#mini-menu-btn").on("click", function(){
    $("#mini-menu-wrapper").slideToggle(50);
  });
 });