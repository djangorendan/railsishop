$('#category_image').change(function () {
  var input = $(this)[0];
  if (input.files && input.files[0]) {
    if (input.files[0].type.match('image.*')) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img').attr('src', e.target.result);
      };
      reader.readAsDataURL(input.files[0]);
    } else {
      console.log('ошибка, не изображение');
    };
  } else {
    console.log('хьюстон у нас проблема');
  };
});
