/*
 *  Scripts related to the home page of the blog
 */

// Hovering on header images in the case of a desktop display
if ($(window).width() >= 1024) {
  $('.home .header .left').hover(
    function() {
      $('.home .header .left .inner').css('background', 'rgba(0, 0, 0, 0.1)');
    }, function() {
      $('.home .header .left .inner').css('background', 'rgba(0, 0, 0, 0.3)');
    }
  );

  $('.home .header .right .top').hover(
    function() {
      $('.home .header .right .top .inner').css('background', 'rgba(0, 0, 0, 0.1)');
    }, function() {
      $('.home .header .right .top .inner').css('background', 'rgba(0, 0, 0, 0.3)');
    }
  );

  $('.home .header .right .bottom').hover(
    function() {
      $('.home .header .right .bottom .inner').css('background', 'rgba(0, 0, 0, 0.1)');
    }, function() {
      $('.home .header .right .bottom .inner').css('background', 'rgba(0, 0, 0, 0.3)');
    }
  );
}