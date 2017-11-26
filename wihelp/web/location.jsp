<%-- 
    Document   : location
    Created on : Nov 26, 2017, 2:08:29 PM
    Author     : yanaramli22
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <style>
            #map {
                height: 400px;
                width: 100%;
            }
        </style>
    </head>
    <body>
        <h3>My Google Maps Demo</h3>
        <div id="map"></div>
        <script>
            function initMap() {
                var uluru = {lat: -25.363, lng: 131.044};
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 4,
                    center: uluru
                });
                var marker = new google.maps.Marker({
                    position: uluru,
                    map: map
                });
            }
        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBzxZ-hNE1Vk93BIy1un86pj51nn2YXGrg&callback=initMap">
        </script>
    </body>
</html>
