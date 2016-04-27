/*
 *  Scripts related to the social media sharing
 */

// Social sharing via Facebook
$('#facebook-share-top, #facebook-share-bottom').click(function() {
  FB.ui({
    method: 'share',
    href: $('meta[property="og:url"]').attr('content'),
  }, function(response){
    //console.log(response);
  });
});
