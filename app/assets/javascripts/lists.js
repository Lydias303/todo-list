$(document).ready(function () {

  $('.todo-list').on('click', function (e) {
    e.preventDefault();

    var listId = $(this).data('list-id');

    var url = $(this).attr('href');

    $.getJSON(url).then(function (list) {
      console.log(list)
      $('#todo-list').removeClass('hidden');
      $('.list-title').html('<h1>' + list.title + '</h1>');
      $('#new-todo').data('list-id', list.id);
      debugger;
      for(var i = 0; i < list.todos.length; i++) {
        $("#todo-item").append("<li class='list-group-item'>"+ list.todos[i] +"</li>");
       }
      })
    });

  $('#add-todo').on('click', function (e) {
    e.preventDefault();
    var todoText = $('#new-todo-input').val();
    var list = $('#new-todo').data('list-id');

    $.post('/todos.json', {
      todo: {
        list: list,
        text: todoText
      }
    }).then(function (d) {
      console.log(d);
    });
  });
});
