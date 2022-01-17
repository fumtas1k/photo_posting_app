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

  function set_btn_disable(){
    let flag = false;
    if ($("#form-picture-existent").length){
      flag = true;
    } else {
      $(".form-picture-input").each(function(e){
        if ($(".form-picture-input").eq(e).val() != "") {
        flag = true;
        }
      });
    }
    if (flag) {
      $("#form-picture-btn").prop("disabled", false);
    } else {
      $("#form-picture-btn").prop("disabled", true);
    }
  }

  set_btn_disable();
  $(".form-picture-input").on("change", function(){
    set_btn_disable();
  });

  if (["/pictures", "/"].indexOf(location.pathname) !== -1) {
    $(".fa-home").addClass("fa-blue");
  } else {
    $(".fa-home").removeClass("fa-blue");
  }
  if (location.pathname === "/users") {
    $(".fa-user-friends").addClass("fa-blue");
  } else {
    $(".fa-user-friends").removeClass("fa-blue");
  }
});
