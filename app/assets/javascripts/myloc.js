function success(position) {
  alert("this msg from myloc.js file, and I found you!");
  // lat = position.coords.latitude;
  // lng = position.coords.longitude;
  // acc = position.coords.accuracy;
}

function error(msg) {
  alert("this msg from the myloc.js file, but I failed to get your location.");
  // var s = document.querySelector('#status');
  // s.innerHTML = typeof msg == 'string' ? msg : "failed";
  // s.className = 'fail';
}

function userLoc() {
	// if (navigator.geolocation) {
 	 	navigator.geolocation.getCurrentPosition(success, error, {enableHighAccuracy:true});
	// } else {
  	// error('not supported');
	// };
};