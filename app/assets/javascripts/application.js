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
//= require algolia/v3/algoliasearch.min
//= require jquery.textcomplete
//= require typeahead.bundle
//= require handlebars
//= require nprogress
//= require algolia
//= require sweetalert.min
//= require moment
//= require bootstrap-datetimepicker
//= require tinymce

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
  $('span.category-bar-item[data-toggle="tooltip"], .sponsors a[data-toggle="tooltip"], ul.social-links li a[data-toggle="tooltip"]').tooltip()
});

$(function() {
  $("#menu").on("click", function(event){
    if($("body").hasClass("sidebar-visible")) {
      $("body").removeClass("sidebar-visible");
      $("body").addClass("sidebar-hidden");
      $.post( "/hide_sidebar", function( data ) {});
    } else {
      $("body").removeClass("sidebar-hidden");
      $("body").addClass("sidebar-visible");
      $.post( "/show_sidebar", function( data ) {});
    }
    event.preventDefault();
  });
});


$(document).on('page:fetch', function() {
  NProgress.start();
});

$(document).on('page:change', function() {
  NProgress.done();
});

$(document).on('page:restore', function() {
  NProgress.remove();
});

NProgress.configure({ showSpinner: false });


$(function() {
  $("[data-behavior='add-hackathon']").on("click", function(event){
    event.preventDefault()

    swal({   
      title: "Found a hackathon we have not listed yet?",   
      text: "Submit it through our Typeform! Thank you :)",   
      type: "info",   
      showCancelButton: true,   
      confirmButtonColor: "#DD6B55",
      confirmButtonText: "Yes, add it!",   
      closeOnConfirm: false
    }, 
      function(){   
        url = "https://hackevents.typeform.com/to/WGEBKK";
        $(open(url, '_blank'));
    });
  });
});


$(function() {
  var $form = $('#mc-embedded-subscribe-form');
 
  $('#mc-embedded-subscribe').on('click', function(event) {
    if(event) event.preventDefault();
    register($form);
  });
});

function register($form) {
  $.ajax({
    type: $form.attr('method'),
    url: $form.attr('action'),
    data: $form.serialize(),
    cache       : false,
    dataType    : 'json',
    contentType: "application/json; charset=utf-8",
    error       : function(err) { swal("Oops...", "Something went wrong!", "error"); },
    success     : function(data) {
      
      if (data.result != "success") {
        var message = data.msg.substring(4);
        swal("Oops...", message, "error");
      } 
 
      else {
        var message = data.msg;
        swal({
          title: "Success!",   
          text: '<span style="success">'+message+'</span>',   
          html: true,
          type: 'success' });
      }
    }
  });
}

$(function() {
  $('.add_child').click(function() {
    var association = $(this).attr('data-association');
    var target = $(this).attr('target');
    var regexp = new RegExp('new_' + association, 'g');
    var new_id = new Date().getTime();
    var Dest = (target == '') ? $(this).parent() : $('#'+target);
    Dest.append(window[association+'_fields'].replace(regexp, new_id));
    return false;
  });
});

$(document).delegate('.remove_child','click', function() {
  $(this).parent().children('.removable')[0].value = 1;
  $(this).parent().hide();
  return false;
});
