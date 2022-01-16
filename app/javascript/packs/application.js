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

  let flag = false;
  $(".form-picture-input").each(function(e){
    if ($(".form-picture-input").eq(e).val() != "") {
      flag = true;
    }
  });
  if (flag) {
    $("#form-picture-btn").prop("disabled", false);
  } else {
    $("#form-picture-btn").prop("disabled", true);
  }
  $(".form-picture-input").on("change", function(){
    flag = false;
    $(".form-picture-input").each(function(e){
      if ($(".form-picture-input").eq(e).val() != "") {
        flag = true;
      }
    });
    if (flag) {
      $("#form-picture-btn").prop("disabled", false);
    } else {
      $("#form-picture-btn").prop("disabled", true);
    }
  });
});
