// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require 'masonry.pkgd'

// $(function(){
//   console.log('hello')
// var container = document.querySelector('#group-cards-container');
// var msnry = new Masonry( container, {
//   itemSelector: '.group-card'
// });
// })

$(function() {
  // On pressing delete_step1 show delete_step2 for a few seconds
  $("#delete_step1").on("click", function() {
    $("#delete_step2").show();
    setTimeout(function(){$("#delete_step2").hide()}, 3000 );
  });

  var appCache = window.applicationCache;
  appCache.addEventListener('progress', function(e){
    var progress = parseInt(e.loaded/e.total * 100);
    $('.cache-progress-bar').show();
    $('.cache-progress-bar__progress').width(progress + '%');
    $('.cache-progress-bar__text').text(progress + '%');

    if(progress === 100) {
      $('.cache-progress-bar').remove();
    }
  }, false);
});