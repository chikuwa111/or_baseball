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
//= require bootstrap-sprockets
//= require_tree .

$(function() {
  $(".detail-btn").click(function() {
    $(this).parent().children(".detail").slideToggle();
    if ($(this).children(".fa").hasClass("fa-chevron-down")) {
      $(this).children(".fa").removeClass("fa-chevron-down");
      $(this).children(".fa").addClass("fa-chevron-up");
      $(this).children(".gap").text("詳細を隠す");
    } else {
      $(this).children(".fa").removeClass("fa-chevron-up");
      $(this).children(".fa").addClass("fa-chevron-down");
      $(this).children(".gap").text("詳細を見る");
    }
  })
});
