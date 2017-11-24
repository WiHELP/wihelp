<%-- 
    Document   : formEvent
    Created on : Nov 24, 2017, 4:07:19 PM
    Author     : yanaramli22
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<!DOCTYPE HTML>

<html>
    <head>
        <title>Elements - Solid State by HTML5 UP</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <body>

        <!-- Page Wrapper -->
        <div id="page-wrapper">

            <!-- Header -->
            <header id="header">
                <h1><a href="index.html">Solid State</a></h1>
                <nav>
                    <a href="#menu">Menu</a>
                </nav>
            </header>

            <!-- Menu -->
            <nav id="menu">
                <div class="inner">
                    <h2>Menu</h2>
                    <ul class="links">
                        <li><a href="index.html">Home</a></li>
                        <li><a href="generic.html">Generic</a></li>
                        <li><a href="elements.html">Elements</a></li>
                        <li><a href="#">Log In</a></li>
                        <li><a href="#">Sign Up</a></li>
                    </ul>
                    <a href="#" class="close">Close</a>
                </div>
            </nav>

            <!-- Wrapper -->
            <section id="wrapper">
                <header>
                    <div class="inner">
                        <h2>Elements</h2>
                        <p>Phasellus non pulvinar erat. Fusce tincidunt nisl eget ipsum.</p>
                    </div>
                </header>

                <!-- Content -->
                <div class="wrapper">
                    <div class="inner">

                        <section>
                            <h3 class="major">Share Event</h3>
                            <form method="post" action="formEvent">
                                <div class="row uniform">
                                    <div class="6u 12u(xsmall)">
                                        <label for="eventName">Event Name</label>
                                        <input type="text" name="eventName" id="eventName" value="" />
                                    </div>
                                    <div class="6u 12u(xsmall)">
                                        <label for="eventDate">Date</label>
                                        <input type="text" name="eventDate" id="eventDate" value="" />
                                    </div>
                                    <div class="12u">
                                        <label for="eventLocation">Location</label>
                                        <input type="text" name="eventLocation" id="eventLocation" value="" />
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
                                        <li><input type="submit" value="Send Message" class="special" /></li>
                                        <li><input type="reset" value="Reset" /></li>
                                    </ul>
                                </div>
                                </div>
                            </form>
                        </section>
                    </div>
                </div>
            </section>

            <!-- Footer -->
            <section id="footer">
                <div class="inner">                    
                    <ul class="copyright">
                        <li>&copy; Untitled Inc. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
                    </ul>
                </div>
            </section>

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
