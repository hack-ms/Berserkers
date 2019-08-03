$(document).on('turbolinks:load', function() {

  navigator.geolocation.getCurrentPosition((position, error) => {
    var $latInput = $("#js_lat");
    var $lngInput = $("#js_lng");

    if ($latInput != null && $lngInput != null) {
      if (position) {
        $latInput.val(position.coords.latitude.toString());
        $lngInput.val(position.coords.longitude.toString());
      } else {
        $latInput.val(-20.464339.toString());
        $lngInput.val(-54.619041.toString());
      }
    }

    $linkToMaps = $('#link_to_maps');

    if($linkToMaps.lenght === 0) {return ;}

    $linkToMaps[0].href = $linkToMaps[0].href.replace('-20.4532764,+-54.6050757', `${$latInput.val()},+${$lngInput.val()}`)
  })

});