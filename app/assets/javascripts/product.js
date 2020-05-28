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
});
