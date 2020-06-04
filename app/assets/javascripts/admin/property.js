$('.dd').nestable('serialize');

$('.dd').on('change', function() {
  var list = $('.dd').nestable('serialize');

  $.each(list, function(index, list){
    var data = {
      property_id: list.id,
      position: index,
      parent_id: "",
    };
    $.ajax({
      url: "/admin/properties/set_position",
      data: data,
    });
    console.log(data)
    $.each(list.children, function(index, child){
      var data = {
        property_id: child.id,
        position: index,
        parent_id: list.id,
      };
      $.ajax({
        url: "/admin/properties/set_position",
        data: data,
      });
      console.log(data)
    });
  });
});
