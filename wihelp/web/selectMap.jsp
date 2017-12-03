<%-- 
    Document   : selectMap
    Created on : Nov 30, 2017, 11:12:13 PM
    Author     : Ikmal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            /* The Modal (background) */
            .modal2 {
                display:none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 2; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content2 {
                background-color: #2e3141;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            /* The Close Button */
            .close2 {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close2:hover,
            .close2:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
            #map{
                width: 500px;
                height: 500px;
            }

            #current{
                padding-top: 25px;
            }
        </style>

    </head>
    <body>

        <!-- The Modal -->
        <div id="myModal2" class="modal2">

            <!-- Modal content -->
            <div class="modal-content2" id="map">
                <span class="close2">&times;</span>
                <script>
                    var map;
                    
                    function map() {
                        var myLatlng = {lat: 1.558589, lng: 103.637171};

                        map = new google.maps.Map(document.getElementById('map'), {
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
                            document.getElementById('eventLocationPos').value = event.latLng;
                        });

                        $(window).resize(function () {
                            // (the 'map' here is the result of the created 'var map = ...' above)
                            google.maps.event.trigger(map, "resize");
                        });
                    }
                    
                    var modal2 = document.getElementById('myModal2');

                    // Get the button that opens the modal
                    var btn2 = document.getElementById("myBtn2");

                    // Get the <span> element that closes the modal
                    var span2 = document.getElementsByClassName("close2")[0];

                    // When the user clicks the button, open the modal 
                    btn2.onclick = function () {
                        modal2.style.display = "block";
                        google.maps.event.trigger(map, 'resize');
                    }

                    // When the user clicks on <span> (x), close the modal
                    span2.onclick = function () {
                        modal2.style.display = "none";
                    }

                    // When the user clicks anywhere outside of the modal, close it
                    modal2.onclick = function (event) {
                        if (event.target == modal2) {
                            modal2.style.display = "none";
                        }
                    }



                </script>

                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgbms2OQnqOyeY5qRUpHTU2Tz2XtrIpgk&libraries=places&callback=map"></script>
            </div>                                
        </div>


    </body>
</html>
