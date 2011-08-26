MY_MAP_ID = "desaturated"
MY_MAP_NAME = if lang() is "ja" then "白黒" else "Desaturated"
ICON_URL = "http://labs.google.com/ridefinder/images/mm_20_white.png"
STROKE_OPACITY = 0.8
STROKE_WIDTH = 5
DESATURATION = 80

window.draw = (locations, color = null) ->
     
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
    points.push point if color?
    markers.push new google.maps.Marker
      icon: ICON_URL
      position: point
      title: name

  myLatLng = new google.maps.LatLng (corners.lat.min + corners.lat.max) / 2, (corners.lng.min + corners.lng.max) / 2

  desaturatedStyles = [
    featureType: "all",
    stylers: [saturation: -DESATURATION]
  ]
  myOptions =
    zoom: 11
    center: myLatLng
    mapTypeControlOptions:
      mapTypeIds: [google.maps.MapTypeId.ROADMAP, MY_MAP_ID]
  map = new google.maps.Map document.getElementById("map_canvas"), myOptions
  map.mapTypes.set MY_MAP_ID, new google.maps.StyledMapType desaturatedStyles, { name: MY_MAP_NAME }
  map.setMapTypeId MY_MAP_ID

  if color?
    polyline = new google.maps.Polyline
      path:          points
      strokeColor:   color
      strokeOpacity: STROKE_OPACITY
      strokeWeight:  STROKE_WIDTH

    polyline.setMap map

  marker.setMap map for marker in markers
