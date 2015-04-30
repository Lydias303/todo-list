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
        $("#todo-item").append("<li class='list-group-item' todo-id='" + todo.id + "'><input type='checkbox' data-todo-id='" +
         todo.id + "' />" + todo.todo_item +
         "<button class='btn btn-danger remove'><span class='glyphicon glyphicon-trash'></span></button>" +
         "</li>");
       }
       $('.remove').on('click', function (e) {
         e.preventDefault();
         console.log(e.currentTarget.parentElement)
         var todo = e.currentTarget.parentElement;
         var todo_id = $(todo).attr('todo-id')
         console.log(todo_id)


         $.ajax({
            url: '/todos/' + todo_id,
            type: 'DELETE',
            success: function(result) {
              console.log('deleted')
            }
         });

         e.currentTarget.parentElement.remove();
       });
      })
      });

    // $("#remove").on('click', function () {
    //   debugger;
    //   $('.data-todo-id=' + todo.id ).remove();
    //   });


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
       "<button class='btn btn-danger remove' id='delete-button'><span class='glyphicon glyphicon-trash'></span></button>" +
       "</li>");
      //  $("#delete-button").on('click', function(e){
      //      e.preventDefault();
      //      console.log('hello')
      //      var a = $('#remove')
       //
      //      a.closest('li').remove();
      //  });
    });
  });


});


// $("#delete-button").on("click", function() {
//   $(this).remove()
// });
//
// $("#delete-button").on('click', function(e){
//     e.preventDefault();
//     console.log('hello')
//     var a = $('#remove')
//
//     a.closest('li').remove();
// // });
