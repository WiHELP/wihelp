<!DOCTYPE html>
<html>
    <body>

        <h1>My First Google Map</h1>

        <div id="map" style="width:400px;height:400px;background:yellow"></div></a>

        <script>
            function initMap() {
        var uluru = {lat: -25.363, lng: 131.044};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 4,
          center: uluru
        });
        
      }
        </script>

        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgbms2OQnqOyeY5qRUpHTU2Tz2XtrIpgk&callback=initMap"></script>
        <!--
        To use this code on your website, get a free API key from Google.
        Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
        -->

    </body>
</html>
