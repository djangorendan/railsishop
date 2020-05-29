function windowSize(){
  if ($(window).width() <= '992'){
    $('.wrapper').removeClass("container").addClass("container-fluid");
    $('#cart_link').attr('data-remote', 'false');
  } else {
    $('.wrapper').removeClass("container-fluid").addClass("container");
    $('#cart_link').attr('data-remote', 'true');
  };
};

$(window).on('load resize',windowSize);
