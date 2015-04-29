$(document).ready(function () {

  $('.todo-list').on('click', function (e) {
    e.preventDefault();

    var listId = $(this).data('list-id');
    var url = $(this).attr('href');

    $.getJSON(url).then(function (list) {

      $('.list-title').html('<h1>' + list.title + '</h1>');


    });
  });


});
