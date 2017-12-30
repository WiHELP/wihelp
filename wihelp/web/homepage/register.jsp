

<!DOCTYPE html>
<html>
    <head>
        <title>WiHELP</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <style>
            /* The Modal (background) */
            .modal {
                display: block; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                padding-top: 20%; /* Location of the box */
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
                max-width: 30%;
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
    <script>

            function licenseVis() {
                var x = document.getElementById("patient").checked;
                var y = document.getElementById("counselor").checked;


                if (x == true) {
                    document.getElementById("license").style.display = "none";
                    document.getElementById("licenseInput").disabled = true;
                }
                if (y == true) {
                    document.getElementById("license").style.display = "unset";
                    document.getElementById("licenseInput").disabled = false;
                }

            }
        </script>

    <body>
        <!-- header section -->
        <jsp:include page="homepageHeader.jsp"></jsp:include>
        
         <%
            String pop = (String) session.getAttribute("PString");
            if (pop != null) {
        %>
        <!-- The Modal -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">  
                <span class="close"></span>
                <center><%= pop%></center>
            </div>                                
        </div>
        <%
            }
            session.setAttribute("PString", null);
        %>    
    
    <br>
    <div class="container-fluid">
        <!-- <div class="panel panel-success">
             <div class="panel-heading" align="center">
                 <h4><b><font color="black" style="font-family: fantasy;">Create Your Profile</font> </b></h4>
             </div>-->
        <div class="panel-body" align="center">

            <div class="container " style="margin-top: 10%; margin-bottom: 10%;">

                <div class="panel panel-success" style="max-width: 35%;" align="left">

                    <div class="panel-heading form-group" style="max-height: 60%;">
                        <h3 class="major">USER REGISTRATION</h3>
                    </div>

                    <div class="panel-body" >

                        <form action="../register" method="post" >
                            <div class="form-group">
                                <div style="display:block;text-align:center;">
                                    <input type="radio" id="patient" name="userType" checked required="required" value="patient" onclick="licenseVis()">
                                    <label for="patient">Patient</label>
                                    <input type="radio" id="counselor" name="userType" required="required" value="counselor" onclick="licenseVis()">
                                    <label for="counselor">Counselor</label>
                                </div>
                            </div>

                            <div>
                                <label for="name">Name</label>
                                <input type="text" name="name" id="name" required="required" />
                            </div>
                            <BR>
                            <div>
                                <label for="year">Age</label>
                                <input type="text" name="age" id="age" required="required"/>
                            </div>
                            <BR>
                            <div>
                                <label for="Address">Address</label>
                                <input type="text" name="address" id="address" required="required"/>
                            </div>
                            <BR>
                            <div>
                                <label for="Email">Email</label>
                                <input type="email" name="email" id="email" required="required" />
                            </div>
                            <BR>
                            <div>
                                <label for="username">Username</label>
                                <input type="text" name="username" id="username" onkeyup="validateExist(this.value)" required="required"/>
                                <div id="exist" class="" style="display:none">*Already exist</div>
                            </div>
                            <BR>
                            <div>
                                <label for="Password">Password</label>
                                <input type="password" name="password" id="password" required="required" />
                            </div>
                            <BR>
                            <div id="license" style="display:none;">
                                <label for="License">License</label>
                                <input type="text" name="license" id="licenseInput" required disabled/>
                            </div>
                            <BR>
                            <input type="submit" class="special" value="Create" >
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="assets/js/main.js"></script>

        <script>
        // Get the modal
        var modal = document.getElementById('myModal');

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[1];

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
