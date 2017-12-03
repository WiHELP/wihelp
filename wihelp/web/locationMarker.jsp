<%-- 
    Document   : locationMarker
    Created on : Nov 27, 2017, 10:10:36 AM
    Author     : Ikmal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>        
        <div id='map'></div>
        <div id="current">Nothing yet...</div>

        <style>
            #map{
                width: 400px;
                height: 300px;
            }

            #current{
                padding-top: 25px;
            }
        </style>

        <script>
            var markers = [];
            function map() {
                var myLatlng = {lat: 1.558589, lng: 103.637171};

                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 14,
                    center: myLatlng
                });
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map
                });

                map.addListener("click", function (event) {
                    if (marker) {
                        marker.setMap(null);
                    }
                    marker = new google.maps.Marker({
                        position: event.latLng,
                        map: map
                    });
                    document.getElementById('current').innerHTML = event.latLng;

                });
            }



        </script>

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgbms2OQnqOyeY5qRUpHTU2Tz2XtrIpgk&libraries=places&callback=map"></script>
    </body>
</html>
