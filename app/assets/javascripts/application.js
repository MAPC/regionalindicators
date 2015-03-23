// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require twitter/typeahead.min
//= require d3.v3
//= require miso.ds.deps.ie.0.4.1
//= require lib/d3.chart.min.js
//= require lib/tufted.js
//= require lib/sticky-kit.min.js
//= require_tree .

$(document).ready(function () {
  $('.sticky-title').stick_in_parent({offset_top: 10});
  $('.typeahead').typeahead({ prefetch: '/suggest.json' });
})