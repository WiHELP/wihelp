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
        <jsp:include page="homepageHeader.jsp"></jsp:include>

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
</body>
</html>
