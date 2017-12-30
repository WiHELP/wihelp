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

    <body>
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
        <div class="container-fluid">
            <div class="container">

            </div>
            <!--<div class="panel panel-success" style="margin-top: 10%; margin-width: 20% ">
            <!--<div align="center" class="jumbotron">
                <h1><b><font color="black" style="font-family: fantasy;">WiHELP</font> </b></h1>
            </div>-->

            <div class="panel-body" style="margin-top: 10%" align="center">

                <div  style="margin-width: 0%;">

                    <div class="panel panel-success" style="max-width: 40%;" align="center">

                        <div class="panel-heading form-group" style="max-height: 60%;">
                            <h3 class="major">LOGIN</h3>
                        </div>

                        <div class="panel-body" >

                            <form action="../login" method="post" >

                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input id="user" type="text" class="form-control" name="username" value="" placeholder="User">                                        
                                </div> <br>

                                <div class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <input id="password" type="password" class="form-control" name="password" placeholder="Password">
                                </div> 

                                <div style="padding-top: 10px">
                                    <center><button class="special" type="submit" style="width: 70%; font-size:1.1em;"  ><b>LOGIN</b></button></center>
                                </div>
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
