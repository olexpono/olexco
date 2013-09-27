Y.use('node', function(Y) {

  Y.on('domready', function() {
    // Init ImageLoader  
    new Y.Squarespace.Loader({
      img:Y.all('img[data-image]')
    });       
  });
});

// JQuery
$(function() {
  if (!Modernizr.svg) {
    $('img[src$="svg"]').each(function() {
      $(this).attr("src", $(this).data("fallback"));
    });
  }

});
