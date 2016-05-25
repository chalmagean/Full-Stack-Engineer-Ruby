var Comic = (function () {
  var module = {};

  module.upvote = function(comicId) {
    $.ajax({
      url: '/votes',
      data: {
        comic_id: comicId
      },
      type: 'POST',
      dataType: 'json'
    })
    .done(function(json) {
      var $icon = $('#comic-upvote-btn-' + json.comic_id)
        .replaceWith('<span class="fa fa-star" />');
    })
    .fail(function(xhr, status, error) {
      console.log('Error: ', xhr, status, error);
    });
  }

  return module;
}());

$(document).ready(function () {
  $(document).on('click', '.upvote-btn', function(e) {
    var $button = $(e.currentTarget);
    var comicId = $button.data('comic-id');

    Comic.upvote(comicId);
  });
});
