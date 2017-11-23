

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
    </head>

    <body>
        <!-- header section -->
        <jsp:include page="homepageHeader.jsp"></jsp:include>

        <script>

            function licenseVis() {
                var x = document.getElementById("patient").checked;
                var y = document.getElementById("counselor").checked;


                if (x == true) {
                    document.getElementById("license").disabled = true;
                }
                if (y == true) {
                    document.getElementById("license").disabled = false;
                }

            }
        </script>

    </head>

<body> 
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
                                    <input type="radio" id="patient" name="userType" checked required="required" onclick="licenseVis()">
                                    <label for="patient">Patient</label>
                                    <input type="radio" id="counselor" name="userType" checked required="required" onclick="licenseVis()">
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
                                <input type="text" name="age" id="age" />
                            </div>
                            <BR>
                            <div>
                                <label for="Address">Address</label>
                                <input type="text" name="address" id="address" />
                            </div>
                            <BR>
                            <div>
                                <label for="Email">Email</label>
                                <input type="email" name="email" id="email" required="required" />
                            </div>
                            <BR>
                            <div>
                                <label for="username">Username</label>
                                <input type="text" name="username" id="username" onkeyup="validateExist(this.value)" />
                                <div id="exist" class="" style="display:none">*Already exist</div>
                            </div>
                            <BR>
                            <div>
                                <label for="Password">Password</label>
                                <input type="password" name="password" id="password" />
                            </div>
                            <BR>
                            <div>
                                <label for="License">License</label>
                                <input type="text" name="license" id="license" disabled required/>
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

</body>
</html>
