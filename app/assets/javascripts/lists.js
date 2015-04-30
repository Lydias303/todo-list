$(document).ready(function () {

  $('.todo-list').on('click', function (e) {
    e.preventDefault();

    var listId = $(this).data('list-id');

    var url = $(this).attr('href');

    $.getJSON(url).then(function (list) {
`      console.log(list)`
      $("#todo-item").empty();
      $('#todo-list').toggleClass('hidden');
      $('.list-title').html('<h1>' + list.title + '</h1>');
      $('#new-todo').data('list-id', list.id);
      for(var i = 0; i < list.todos.length; i++) {
        var todo = list.todos[i]
        $("#todo-item").append("<li class='list-group-item' todo-id='" + todo.id + "'><input type='checkbox' id='checked' />" +
        "<label class='checkedLabel' for='#checked'>" + todo.todo_item + "</label>" + "<button class='btn btn-sml btn-default remove'><span class='glyphicon glyphicon-trash'></span></button>" +
         "</li>");
       }
       $('.remove').on('click', function (e) {
         e.preventDefault();
         var todo = e.currentTarget.parentElement;
         var todo_id = $(todo).attr('todo-id')

         $.ajax({
            url: '/todos/' + todo_id,
            type: 'DELETE'
         });

         e.currentTarget.parentElement.remove();
       });

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
    }).then(location.reload(true));
  });
});
