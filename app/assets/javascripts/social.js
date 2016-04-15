$('#facebook-share-top').click(function() {
  FB.ui({
    method: 'share',
    href: $('meta[property="og:url"]').attr('content'),
  }, function(response){
    //console.log(response);
  });
});

$('#facebook-share-bottom').click(function() {
  FB.ui({
    method: 'share',
    href: $('meta[property="og:url"]').attr('content'),
  }, function(response){
    //console.log(response);
  });
});
