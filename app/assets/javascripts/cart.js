$('#product_quantity input').on('change input', function() {
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
  send_request(product_count, $(this).attr('data-id'));
});

function send_request(product_count, product_id) {
  var data = {
    product_id: product_id,
    product_count: product_count,
    add_in_cart_modal: true
  };
  $.ajax({
    url: "/carts/product_to_cart",
    data: data
  });
};
