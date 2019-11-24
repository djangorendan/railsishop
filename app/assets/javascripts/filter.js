document.addEventListener("DOMContentLoaded", function(event) {
  if (window.location.href.indexOf("/categories/") > -1) {
    $('.filter_checkbox').on('change', function() {
      var checked = {};
      $('.filter_checkbox:checked').each(function() {
        var productName = $(this).attr('data-product-name');
        var categoryPropertyId = $(this).attr('data-category-property-id');
        if (checked[categoryPropertyId]) {
          checked[categoryPropertyId].push(productName);
        } else {
          checked[categoryPropertyId] = [productName];
        }
      });
      $('#product_properties_field').val(JSON.stringify(checked));
      $('#filter_form').find('[type=submit]').trigger('click');
    });

    $('#product_filter_order').on('change', function() {
      var order = $(this).val().split(' ');
      $('#order_by_field').val(order[0]);
      $('#order_to_field').val(order[1]);
      $('#filter_form').find('[type=submit]').trigger('click');
    });
  }
});
