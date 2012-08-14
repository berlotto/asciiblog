//Example on: http://www.infinite-scroll.com/trigger.html
$(function(){ // wait for document to load
  //Install de default infinite scroll
  $('.artigos').infinitescroll({

    navSelector  : "a#next:last",
                     // selector for the paged navigation (it will be hidden)
                     nextSelector : "a#next:last",
                     // selector for the NEXT link (to page 2)
                     itemSelector : "#body p"
                     // selector for all items you'll retrieve
                   });

  // kill scroll binding
  $(window).unbind('.infscr');

  // hook up the manual click guy.
  $('a#next').click(function(){
    $(document).trigger('retrieve.infscr');
    return false;
  });

  // remove the paginator when we're done.
  $(document).ajaxError(function(e,xhr,opt){
    if (xhr.status == 404) $('a#next').remove();
  });

});
