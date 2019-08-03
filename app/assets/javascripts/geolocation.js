$( document ).ready(function() {

  navigator.geolocation.getCurrentPosition((position, error) => {
    var $latInput = $("#js-lat");
    var $lngInput = $("#js-lng");

    if ($latInput != null && $lngInput != null) { 
      if (position) {
        $latInput.value = position.coords.latitude;
        $lngInput.value = position.coords.longitude;
      } else {
        $latInput.value = -20.464339;
        $lngInput.value = -54.619041;
      }
    }
  })
}