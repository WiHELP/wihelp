<%-- 
    Document   : forum
    Created on : Nov 23, 2017, 5:12:51 PM
    Author     : Ikmal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
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

        <%
            ResultSet rset = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
                String sql = "SELECT * FROM forum join forumdetails on forum.forumId = forumdetails.forumId";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);
            } catch (Exception e) {
                e.printStackTrace();
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

        <!-- Page Wrapper -->
        <div id="page-wrapper">

            <header id="header">
                <a href="homepage/homeview.jsp"><h2>WiHELP</h2></a>
                <nav>
                    <a href="#menu">Menu</a>

                </nav>
            </header>

            <!-- Menu -->
            <nav id="menu">
                <div class="inner">
                    <h2>Menu</h2>
                    <ul class="links">
                        <li><a href="homepage/homeview.jsp">Home</a></li>
                        <li><a href="chat.jsp">Chat</a></li>
                        <li><a href="forum.jsp">Forum</a></li>
                        <li><a href="listevent.jsp">Event</a></li>
                    </ul>
                    <a href="#" class="close">Close</a>
                </div>
            </nav>

            <!-- Banner -->
            <section id="banner">
                <div class="inner">
                    <div class="logo"><span class=""></span></div>
                    <center><h2>FORUM</h2></center>
                    <center><p>Join a forum.</p></center>
                </div>
            </section>

            <div class="wrapper">
                <div class="inner">

                    <section>

                        <button id="myBtn">Start New Thread</button>
                        <br><br>

                        <div id="myModal" class="modal">

                            <!-- Modal content -->
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <form method="post" action="createForum">
                                    Forum title:<input type="text" name="forumTitle">
                                    <br>
                                    Forum body:<textarea type="text" name="forumContent"></textarea>
                                    <br>
                                    <input type="submit">
                                </form>
                            </div>

                        </div>
                        <table>                
                            <%
                                String forumid = "";
                                while (rset.next()) {
                                    String title = rset.getString("forumTitle");
                                    String starter = rset.getString("startUser");
                                    String fId = rset.getString("forumId");
                                    if (!forumid.equals(fId)) {
                                        forumid = fId;
                            %>

                            <tr>
                                <td rowspan="2"><%out.print("<a href=forumThread.jsp?forumid=" + fId + "&forumtitle=" + title + ">" + title + "</a>");%>
                                <td>Start date: <%=rset.getString("startDate")%>
                            </tr>
                            <tr>
                                <td>Start by: <%=starter%>
                            </tr>

                            <%
                                    }
                                }
                            %>
                        </table>
                    </section>
                </div>
            </div>
    </body>
    <script>
        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        btn.onclick = function () {
            modal.style.display = "unset";
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
</html>
