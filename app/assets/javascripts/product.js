$(document).ready(function(){
  $('#product_quantity').on('change input', function() {
    var product_count = parseInt($(this).val());
    var max_product_count = parseInt($(this).attr('max'));
    var min_product_count = parseInt($(this).attr('min'));
    if (product_count > max_product_count) {
      $(this).val(max_product_count);
      product_count = max_product_count;
    };
    if (Number.isNaN(product_count)) {
      $(this).val(min_product_count)
      product_count = min_product_count
    };
  });

  $('.owl-carousel').owlCarousel({
    loop: true,
    nav: true,
    dots: false,
    navContainer: '.custom-nav',
    responsive: {
      0: {
        items: 3,
        margin: 15,
      },
      1199: {
        items: 4,
        margin: 5,
      }
    }
  });

  $('.custom-nav button').addClass('btn');

  function windowSize(){
    if ($(window).width() <= '1200'){
      $('.product_photo_modal').css("max-width", "96%");
    } else {
      $('.product_photo_modal').css("max-width", "1200px");
    };
  };

  $(window).on('load resize',windowSize);

  $('.product_photo_modal_button').on("click", function(){
    var photo_id = $(this).attr('data-id');
    $('#product_photo_modal_'+photo_id).addClass("active");
  });

  $('#photoModal').on('hidden.bs.modal', function () {
    $('.product_photo_modal_item').removeClass('active');
  });

  var product_side_height = $('.product_side').height();
  var photo_height = $('#carouselAllAboutProductPhotoIndicators').height();
  var discription_text_height = $('.discription_text').height();
  var discription_height = product_side_height - photo_height;
  $('.discription').height(discription_height);
  console.log(product_side_height);
  console.log(photo_height);
  console.log(discription_height);
  console.log($(discription_text_height));

  if (discription_text_height < discription_height){
    $('.details').addClass("d-none");
  };

  $('.details').click(function(e){
    e.preventDefault();
    $('.discription').toggleClass('opener');
    if (!$(this).data('status')) {
      $(this).data('status', true).html('Скрыть');
    }else{
      $(this).data('status', false).html('Подробнее');
    };
  });

  $('#more_specifications').click(function(e){
    e.preventDefault();
    $('#specifications-tab').tab('show');
  });

  $('#more_comments').click(function(e){
    e.preventDefault();
    $('#productComments-tab').tab('show');
  });

});
