window.draw = (locations, color = "#000000") ->
  points = []
  markers = []
  corners =
    lat:
      min:   90
      max:  -90
    lng:
      min:  180
      max: -180

  for location in locations
    name = location[0]
    lat  = location[1]
    lng  = location[2]
    corners.lat.min = lat if lat < corners.lat.min
    corners.lat.max = lat if lat > corners.lat.max
    corners.lng.min = lng if lng < corners.lng.min
    corners.lng.max = lng if lng > corners.lng.max
    point = new google.maps.LatLng lat, lng
    points.push point
    markers.push new google.maps.Marker
      position: point
      title: name

  myLatLng = new google.maps.LatLng (corners.lat.min + corners.lat.max) / 2, (corners.lng.min + corners.lng.max) / 2
  myOptions =
    zoom: 11
    center: myLatLng
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map document.getElementById("map_canvas"), myOptions

  # Construct the polygon
  polyline = new google.maps.Polyline
    path:          points
    strokeColor:   color
    strokeOpacity: 0.8
    strokeWeight:  2

  polyline.setMap map
  marker.setMap map for marker in markers
