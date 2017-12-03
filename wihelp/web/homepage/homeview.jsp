<%-- 
    Document   : homeview
    Created on : Nov 11, 2017, 3:45:14 PM
    Author     : yanaramli22
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html class="no-js" lang="">




    <head>
        <title>WiHELP</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <%

            String user = (String) session.getAttribute("userSession");
            String user2 = (String) session.getAttribute("userSessionName");
            String user3 = (String) session.getAttribute("userType");
            String setting = null;
            
            if(user2.equals("patient")){
            ResultSet rset = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
                //          if(!connection.isClosed())
                //               out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                //          connection.close();
                String sql = "Select setting from patient where username='"+user+"'";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);                
                while (rset.next()) {
                    setting = rset.getString("setting");
                }
            } catch (Exception ex) {
                out.println("Unable to connect to database.");
            }
            }
        %>
    </head>

    <body>

        <!-- Scripts -->
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets/js/main.js"></script>


        <div id="page-wrapper">

            <!-- Header -->
            <header id="header" class="alt">
                <a href="homeview.jsp"><h2>WiHELP</h2></a>
                <nav>
                    <a href="#menu">Menu</a>
                    <a href="../dassTest.html">
                        <button id="myBtn" class="button">Screening Test</button>
                    </a>
                </nav>
            </header>

            <!-- Menu -->
            <nav id="menu">
                <div class="inner">
                    <h2>Menu</h2>
                    <ul class="links">
                        <li><a href="homeview.jsp">Home</a></li>
                        <!--<li><a href="Login.jsp">Log In</a></li>
                        <li><a href="register.jsp">GET STARTED</a></li>-->
                    </ul>
                    <a href="#" class="close">Close</a>
                </div>
            </nav>

            <!-- Banner -->
            <section id="banner">
                <div class="inner">
                    <div class="logo"><span class=""></span></div>
                    <center><h2>WiHELP</h2></center>
                    <center><p>Convenient, private online counseling and better forum. Anytime, anywhere.</p></center>


                </div>
            </section>


            <div class="wrapper">

                <div class="inner"> 
                    <h1 class="major"><center>WELCOME, USERNAME</center></h1>
                    <center><%= setting %></center>
                    <section>
                        <div class="box alt" style="margin-top: 10%;">
                            <div class="row uniform">

                                <div class="4u">
                                    <center><h3>Chat</h3></center>
                                    <span class="image fit">
                                        <a href="../chat.jsp">
                                            <img src="images/chat.png" alt="" />
                                        </a>
                                    </span>
                                </div>
                                <div class="4u">
                                    <center><h3>Join Forum</h3></center>
                                    <span class="image fit">
                                        <a href="../forum.jsp">
                                            <img src="images/forum.png" alt="" />
                                        </a>
                                    </span>
                                </div>
                                <div class="4u">
                                    <center><h3>List of Event</h3></center>
                                    <span class="image fit">
                                        <a href="../listevent.jsp">
                                            <img src="images/share.png" alt="" />
                                        </a>
                                    </span>
                                </div>

                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </body>
</html>
