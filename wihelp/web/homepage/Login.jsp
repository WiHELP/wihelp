<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
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
                            <b><font>LOGIN</font> </b>
                        </div>
                    
                        <div class="panel-body" >

                        <form action="login" method="post" >
                             
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id="user" type="text" class="form-control" name="username" value="" placeholder="User">                                        
                            </div> <br>

                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input id="password" type="password" class="form-control" name="password" placeholder="Password">
                            </div> 
                            
                            <div style="padding-top: 10px">
                            <center><button type="submit" style="width: 70%; font-size:1.1em;" class="btn btn-large btn btn-success btn-lg btn-block" ><b>LOGIN</b></button></center>
                            </div>
                        </form>

                        </div>
                    </div>
                    
                </div>
                
            </div>
           
        </div>
    </div>
    
</body>
</html>
