$(document).ready(function () {

  $('.todo-list').on('click', function (e) {
    e.preventDefault();

    var listId = $(this).data('list-id');

    var url = $(this).attr('href');

    $.getJSON(url).then(function (list) {
`      console.log(list)`
      $("#todo-item").empty();
      $('#todo-list').removeClass('hidden');
      $('.list-title').html('<h1>' + list.title + '</h1>');
      $('#new-todo').data('list-id', list.id);
      for(var i = 0; i < list.todos.length; i++) {
        var todo = list.todos[i]
        $("#todo-item").append("<li class='list-group-item'><input type='checkbox' data-todo-id='" +
         todo.id + "' />" + todo.todo_item +
         "<a href='#' class='trash'><span class='glyphicon glyphicon-trash' data-todo-id='" + todo.id + "' ></span></a>" +
         "<a href='#' class='flag'><span class='glyphicon glyphicon-flag data-todo-id='" + todo.id + "' ></span></a>" +
         "</li>");
       }
      })
    });

    $('#delete-button').on('click', function () {
        $.post('/lists/destroy', {
          list: list
        });
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
      debugger;
      $("#todo-item").append("<li class='list-group-item'><input type='checkbox' data-todo-id='" +
       d.todo.id + "' />" + d.todo.todo_item +
       "<a href='#' class='trash'><span class='glyphicon glyphicon-trash' data-todo-id='" + d.todo.id + "' ></span></a>" +
       "<a href='#' class='flag'><span class='glyphicon glyphicon-flag data-todo-id='" + d.todo.id + "' ></span></a>" +
       "</li>");
    });
  });
});
