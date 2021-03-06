var alpha_id = #{@alpha.id};
var url_string = "/alphas/" + alpha_id + ".json";
var mp_arr = [];


<%@microposts.each do |micropost_object| %>
  var point_holder = [];
  point_holder[0] = "#{micropost_object.id}"; 
  point_holder[1] = "#{micropost_object.content}";
  point_holder[2] = "#{micropost_object.micropost_lat}";
  point_holder[3] = "#{micropost_object.micropost_lng}";
  point_holder[4] = "#{User.find_by_id(micropost_object.user_id).name}";
  point_holder[5] = "#{User.find_by_id(micropost_object.user_id).handle}";

  mp_arr.push(point_holder);
  point_holder = [];
<% end %>

function success(position) {

  var mapcanvas = document.createElement('div');
  mapcanvas.id = 'mapcanvas';
  mapcanvas.style.height = '400px';
  mapcanvas.style.width = '560px';

  document.querySelector('article').appendChild(mapcanvas);
  
  var latlng = new google.maps.LatLng(= @alpha.alpha_lat , = @alpha.alpha_lng );
  marker = new google.maps.Marker({
    title: "Alpha Source Location",
    position: latlng,
    map: map
  });

  var myOptions = {
    zoom: 15,
    center: latlng,
    mapTypeControl: false,
    navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);

  for (i = 0; i < mp_arr.length; i++) {  
    marker = new google.maps.Marker({
      title: mp_arr[i][1],
      position: new google.maps.LatLng(mp_arr[i][2], mp_arr[i][3]),
      map: map,
    });
  };
};

function error(msg) {
  var s = document.querySelector('#status');
  s.innerHTML = typeof msg == 'string' ? msg : "failed";
  s.className = 'fail';
};

if (navigator.geolocation) { 
  navigator.geolocation.getCurrentPosition(success, error) 
};
else { 
  error('not supported') 
};