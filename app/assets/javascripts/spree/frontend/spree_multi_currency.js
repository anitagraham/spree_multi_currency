$(function() {
  $('#currency').on('change', function() {
    $.ajax({
      type: 'GET',
      url: $(this).data('href'),
      data: {
        currency: $(this).val()
      }
    }).done(function() {
      window.location.reload();
    });
  });
});
