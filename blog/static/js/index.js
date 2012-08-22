$(function(){ // wait for document to load

  //Install de infinite scroll ( tks for http://andersonferminiano.com/jqueryscrollpagination/ )
  $('#artigos').scrollPagination({
      'contentPage': '/blog/more/', // the url you are fetching the results
      'contentData': {}, // these are the variables you can pass to the request, for example: children().size() to know which page you are
      'scrollTarget': $(window), // who gonna scroll? in this example, the full window
      'heightOffset': 5, // it gonna request when scroll is 10 pixels before the page ends
      'beforeLoad': function(){ // before load function, you can display a preloader div
          $('#loading').fadeIn();
      },
      'afterLoad': function(elementsLoaded){ // after loading content, you can use this function to animate your new elements
           $('#loading').fadeOut();
           var i = 0;
           $(elementsLoaded).fadeInWithDelay();
           if ( $('#nomoreresults').length ){ // if no more posts, then #nomereresults will be returned
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
  $('#loading').hide();


  //CONTROL FOR ICON TO SCROLL TO TOP ( tks for http://webdesignerwall.com/tutorials/animated-scroll-to-top )

  // hide #back-top first
  $("#toplink").hide();

  // fade in #back-top
  $(function () {
    $(window).scroll(function () {
      $('#readmore').fadeOut()
      if ($(this).scrollTop() > 100) {
        $('#toplink').fadeIn();
      } else {
        $('#toplink').fadeOut();
      }
    });

    // scroll body to 0px on click
    $('#toplink a').click(function () {
      $('body,html').animate({
        scrollTop: 0
      }, 800);
      return false;
    });
  });


});
