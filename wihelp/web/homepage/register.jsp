

<!DOCTYPE html>
<html>
    <head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign Up</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/flexslider.css">
<link rel="stylesheet" href="css/jquery.fancybox.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/responsive.css">
<link rel="stylesheet" href="css/font-icon.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="homepacss/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <!-- header section -->
        <jsp:include page="homepageHeader.jsp"></jsp:include>
 
        <script>
        
        function licenseVis(){
            var x = document.getElementById("patient").checked;
            var y = document.getElementById("counselor").checked;
            
            
            if(x == true){
                document.getElementById("license").disabled = true;
            }
            if(y == true){
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
                                            
                        <div class="panel-body" >

                        <form action="register" method="post" >
                            <div class="form-group">
                                <label style="display:block;text-align:center;" for="name" >User Registration</label>
                                <div style="display:block;text-align:center;">
                                    <input type="radio"  name="userType" id="patient" value="patient" checked required="required" onclick="licenseVis()"> Patient
                                <input type="radio"  name="userType" id="counselor" value="counselor" onclick="licenseVis()"> Counselor
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name">Name</label> 
                                <input type="text" class="form-control" name="name" id="name" required="required">  
                            </div>
                            <div class="form-group">
                                <label for="year">Age</label> 
                                <input type="text" class="form-control" name="age" id="age">
                            </div>
                            <div class="form-group">
                                <label for="Address">Address</label> 
                                <input type="text" class="form-control" name="address" id="address">
                            </div>
                            <div class="form-group">
                                <label for="Email">Email</label> 
                                <input type="email" class="form-control" name="email" id="email">
                            </div>
                            <div class="form-group">
                                <label for="Username">Username</label> 
                                <input type="text" class="form-control" name="username" id="username" onkeyup="validateExist(this.value)">
                                <div id="exist" class="" style="display:none">*This is required</div>
                            </div>
                            <div class="form-group">
                                <label for="Password">Password</label> 
                                <input type="password" class="form-control" name="password" id="password">
                            </div>
                            <div class="form-group">
                                <label for="License">License</label> 
                                <input type="text" class="form-control" name="license" id="license" disabled required>
                            </div>
                            
                            <input type="submit" style="width: 100%; font-size:1.1em;" class="btn btn-large btn btn-success btn-lg btn-block" value="Create" >                       
                        </form>
                        </div>
                    </div>
                </div>
             </div>
        </div>
    </div>
    </body>
</html>
