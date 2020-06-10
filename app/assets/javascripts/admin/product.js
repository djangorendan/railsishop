$('img').hover(function(){
  var id = $(this).attr('data-id');
  $('#panel_'+id).show();
  $('#panel_'+id).hover(function(){
    $(this).show()
  })
}, function(){
  var id = $(this).attr('data-id');
  $('#panel_'+id).hide();
});

var grid = GridStack.init({
  column: 2,
  disableResize: true,
  verticalMargin: "1rem",
});

grid.on('change', function(e, items){
  grid.compact();
  var widgets = [];
    for (var i = 0; i < items.length; i++) {
      var widgetsObj = {
        'widgetId': items[i].attr('id')
      };
      widgets.push(widgetsObj)
    };
    console.log(widgets)
});
