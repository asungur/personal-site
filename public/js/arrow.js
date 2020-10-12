(() => {
  $('.down-arrow').on('click', function(event){
    event.preventDefault();
    $('html,body').animate({scrollTop: $('#details').offset().top}, 400);
  });

  $('.up-arrow').on('click', function(e){
    e.preventDefault();
    $('html,body').animate({scrollTop: 0}, 400);
  });
})();