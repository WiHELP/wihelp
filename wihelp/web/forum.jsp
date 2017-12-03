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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="assets/css/main.css" />

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
                background-color: #282626;
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
       <section class="banner" role="banner">
            <header id="header" class="alt">
                <h2><a href="homepage/homeview.jsp">WiHELP</a></h2>
                <nav>
                    <a href="#menu">Menu</a>
                </nav>
            </header>

            <nav id="menu">
                <div class="inner">
                    <h2>Menu</h2>
                    <ul class="links">
                        <li><a href="homepage/homeview.jsp">Home</a></li>
                        <li><a href="chat.jsp">Chat</a></li>
                        <li><a href="forum.jsp">Forum</a></li>
                        <li><a href="listevent.jsp">Event</a></li>
                        <li><a href="#">LogOut</a></li>
                    </ul>
                    <a href="#" class="close">Close</a>
                </div>
            </nav>
        </section>
        <div class="wrapper">
            <div class="inner">
                 
                <div>
                    <h1>Forum</h1>
                    <button id="myBtn">New Thread</button>

                    <div id="myModal" class="modal">

                        <!-- Modal content -->
                        <div class="modal-content">
                            <span class="close">&times;</span>
                            <form method="post" action="createForum">
                                Forum title:<input type="text" name="forumTitle">
                                Forum body:<textarea type="text" name="forumContent"></textarea>

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
                            <td rowspan="2"><%out.print("<a href='forumThread.jsp?forumid=" + fId + "&forumtitle=" + title + "'>" + title + "</a>");%>
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
                </div>
            </div>
        </div>
    </body>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.scrollex.min.js"></script>
    <script src="assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="assets/js/main.js"></script>

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
