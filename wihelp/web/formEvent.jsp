<%-- 
    Document   : formEvent
    Created on : Nov 24, 2017, 4:07:19 PM
    Author     : yanaramli22
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
    <head>
        <style>
            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
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
            .modal-content {
                background-color: #2e3141;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            /* The Close Button */
            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
        </style>

    </head>
    <body>

        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <h3 class="major">Share Event</h3>
                <form method="post" action="formEvent">
                    <div class="row uniform">
                        <div class="6u 12u(xsmall)">
                            <label for="eventName">Event Name</label>
                            <input type="text" name="eventName" id="eventName" required />
                        </div>
                        <div class="6u 12u(xsmall)">
                            <label for="eventDate">Date</label>
                            <input type="date" name="eventDate" id="eventDate" required />
                        </div>
                        <div class="12u">
                            <label for="eventLocation">Location</label>
                            <input type="text" name="eventLocation" id="eventLocation" required />
                        </div>
                    </div>  
                    <br>
                    <div class="12u">
                        <label for="description">Event Description</label>
                        <textarea name="description" id="description" rows="6"></textarea>
                    </div>
                    <br>
                    <div class="12u">
                        <ul class="actions">
                            <li><input type="submit" value="Submit" class="special" /></li>
                            <li><input type="reset" value="Reset" /></li>
                        </ul>
                    </div>
                </form>
            </div>                                
        </div>

        <script>
            // Get the modal
            var modal = document.getElementById('myModal');

            // Get the button that opens the modal
            var btn = document.getElementById("myBtn");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal 
            btn.onclick = function () {
                modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>

    </body>
</html>
