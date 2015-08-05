// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  $(".signin_word").on("click", function(event) {
    event.preventDefault();
    $(".signin").toggle("slow");
  })
  $(".signin").keypress(function(e) {
    if(e.which == 10 || e.which == 13) {
      this.submit();
    }
  })
  $(".settings_button").on("click", function() {
    $(".dropdown_container").toggle("slow");
  })
  $("#delete_button_container").on("click", function() {
    $("#delete_form_container").toggle();
    $("#delete_button_container").toggle();
  })
});
