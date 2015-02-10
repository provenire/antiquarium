//
// Antiquarium JS
//
// Rails
// require jquery
// require jquery_ujs
//
// Vendor
//= require pace
//= require modernizr.custom.js
//= require pages/plugins/jquery/jquery-1.8.3.min.js
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap
//= require jquery.easing
//= require jquery-unveil
//= require jquery-bez
//= require jquery.ioslist.min.js
//= require pages/plugins/imagesloaded/imagesloaded.pkgd.min.js
//= require jquery.actual
//= require jquery.scrollbar
// require pages/plugins/jquery-scrollbar/jquery.scrollbar.min.js
//= require classie
//= require switchery
//= require jquery-validate
//= require bootstrap-tagsinput
//= require jquery-cookie
//
// Pages
//= require pages/js/pages.js
//= require tables.js
//
// Application
// require_tree .

$(document).ready(function() {

  // Validate Automatically
  $('form.validated').each(function() {
    $(this).validate({ onkeyup: false });
  });

});
