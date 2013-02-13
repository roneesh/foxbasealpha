function success(position) {
  var lat = document.getElementById('alpha_alpha_lat');
  var lng = document.getElementById('alpha_alpha_lng')
  var acc = document.getElementById('accuracy')
  lat.value = position.coords.latitude;
  lng.value = position.coords.longitude;
  acc.innerHTML = "Accurate to " + position.coords.accuracy + " meters";
}

function error(msg) {
  var s = document.querySelector('#status');
  s.innerHTML = typeof msg == 'string' ? msg : "failed";
  s.className = 'fail';
}
if ('#alpha_alpha_lat' == "") || ('#alpha_alpha_long' == "") {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(success, error, {enableHighAccuracy:true});
  } else {
    error('not supported');
  };
};