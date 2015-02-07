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
//= require datatables
//= require datatables-fixedcolumns
//= require datatables-responsive
//= require bootstrap-tagsinput
//
// Pages
//= require pages/js/pages.js
//= require tables.js
//
// Application
// require_tree .

$(document).ready(function() {
  // Initializes search overlay plugin.
  // Replace onSearchSubmit() and onKeyEnter() with
  // your logic to perform a search and display results
  $('[data-pages="search"]').search({
    searchField: '#overlay-search',
    closeButton: '.overlay-close',
    suggestions: '#overlay-suggestions',
    brand: '.brand',
    onSearchSubmit: function(searchString) {
      console.log("Search for: " + searchString);
    },
    onKeyEnter: function(searchString) {
      console.log("Live search for: " + searchString);
      var searchField = $('#overlay-search');
      var searchResults = $('.search-results');
      clearTimeout($.data(this, 'timer'));
      searchResults.fadeOut("fast");
      var wait = setTimeout(function() {
        searchResults.find('.result-name').each(function() {
          if (searchField.val().length !== 0) {
            $(this).html(searchField.val());
            searchResults.fadeIn("fast");
          }
        });
      }, 500);
      $(this).data('timer', wait);
    }
  });



  // BS to fix ownership history
  $('.ownership-history-panel .panel-body a').live('click', function(event) {
    event.stopPropogation();
  });


  // Validate Automatically
  $('form.validated').each(function() {
    $(this).validate({ onkeyup: false });
  });

});
