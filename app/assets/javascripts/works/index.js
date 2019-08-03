$(document).on('turbolinks:load', function() {
  $citySelect = $('#by_city_id');
  $submitInput = $('#submit_city');

  if ($citySelect.length === 0) { return; }

  $citySelect.on('change', function() {
    $submitInput.click();
  })
});