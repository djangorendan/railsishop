$('#address').on('click', function(){
  $('#address_field').css('display', 'block');
  $('#departament_field').css('display', 'none');
});
$('#departament').on('click', function(){
  $('#address_field').css('display', 'none');
  $('#departament_field').css('display', 'block');
});

$('#order_payment').on('change', function(){
  if($(this).val() == 'Наложенный платеж'){
    $('#order_delivery').val('Доставка Новой Почтой');
    $('.delivery').css('display', 'block');
  }else if ($(this).val() == 'Наличными') {
    $('#order_delivery').val('Самовывоз');
    $('.delivery').css('display', 'none');
  }
});

$('#order_delivery').on('change', function(){
  if($(this).val() == 'Доставка Новой Почтой'){
    if($('#order_payment').val() == 'Наличными'){
      $('#order_payment').val('Наложенный платеж')};
    $('.delivery').css('display', 'block');
  }else if($(this).val() == 'Самовывоз'){
    if($('#order_payment').val() == 'Наложенный платеж'){
      $('#order_payment').val('Наличными')};
    $('.delivery').css('display', 'none');
  }else{
    $('.delivery').css('display', 'none');
  }
});
