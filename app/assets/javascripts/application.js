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
//= require bootstrap-sprockets
//= require jquery.turbolinks
//= require jquery_ujs
//= require underscore
//= require gmaps/google
//= require turbolinks

$(function() {
  $(".table-calendar p.event").hover(
    function() {
      $(".table-calendar p.event").addClass("inactive")
      $(".table-calendar p.event[data-event-id="+$(this).data("event-id")+"]").removeClass("inactive").addClass("highlighted")
    },
    function() {
      $(".table-calendar p.event").removeClass("inactive")
      $(".table-calendar p.event").removeClass("highlighted")
    }
  );
});

$(function() {
  $('span.category-bar-item[data-toggle="tooltip"]').tooltip()
});

$(function() {
  $("#menu").on("click", function(){
    if($("#main").css("marginLeft") == "230px") {
      $("#main").animate({ marginLeft: "0px" }, { duration: 250 });
    } else {
      $("#main").animate({ marginLeft: "230px" }, { duration: 250 });
    }
  });
});
