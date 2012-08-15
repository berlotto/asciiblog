//Example on: http://andersonferminiano.com/jqueryscrollpagination/
$(function(){ // wait for document to load

  var blogPagination = 1;
  //Install de infinite scroll
  $('#artigos').scrollPagination({
      'contentPage': '/blog/more/', // the url you are fetching the results
      'contentData': {
        page: blogPagination
      }, // these are the variables you can pass to the request, for example: children().size() to know which page you are
      'scrollTarget': $(window), // who gonna scroll? in this example, the full window
      'heightOffset': 5, // it gonna request when scroll is 10 pixels before the page ends
      'beforeLoad': function(){ // before load function, you can display a preloader div
          $('#loading').fadeIn();
          blogPagination += 1;
          $(this).opts.contentData = {page: blogPagination};
      },
      'afterLoad': function(elementsLoaded){ // after loading content, you can use this function to animate your new elements
           $('#loading').fadeOut();
           var i = 0;
           $(elementsLoaded).fadeInWithDelay();
           if ($('#artigos').children().size() > 100){ // if more than 100 results already loaded, then stop pagination (only for testing)
              $('#nomoreresults').fadeIn();
              $('#artigos').stopScrollPagination();
           }
      }
  });

  // code for fade in element by element
  $.fn.fadeInWithDelay = function(){
      var delay = 0;
      return this.each(function(){
          $(this).delay(delay).animate({opacity:1}, 200);
          delay += 100;
      });
  };

  $('#nomoreresults').fadeOut();

});
