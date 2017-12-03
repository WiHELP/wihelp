<%-- 
    Document   : forumThread
    Created on : Nov 25, 2017, 9:57:43 PM
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
        <title>WiHELP</title>
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

        <%
            ResultSet rset = null;
            String fId = request.getParameter("forumid");
            String fTitle = request.getParameter("forumtitle");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
                //          if(!connection.isClosed())
                //               out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                //          connection.close();
                String sql = "Select * from forum join forumdetails on forum.forumId = forumdetails.forumId join user on forum.sender = user.username where forum.forumId ='" + fId + "'";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

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

            <!-- Content -->
            <div class="wrapper">
                <div class="inner">

                    <section>

                        <table border="1">
                            <tr>
                                <td colspan="3"><h1><%=fTitle%></h1>
                            </tr>
                            <%
                                while (rset.next()) {
                                    if (rset.isFirst()) {


                            %>
                            <tr>
                                <td><center><img src="images/user.png" alt="" />
                                <br><%=rset.getString("sender")%><br><%=rset.getString("userType")%> </center> 
                            <td rowspan="3" colspan="2"><%=rset.getString("conversationContent")%>

                                </tr>
                            <tr>
                                <td>

                            </tr>
                            <tr>
                                <td>              
                            </tr>
                            <tr>
                                <td>
                                <td>
                                <td align="right">#<%=rset.getString("conversationId")%>
                            </tr>
                            <tr>
                                <td>
                                <td>Created on:
                                <td><%=rset.getString("startDate")%>
                            </tr>
                            <%
                            } else {
                            %>
                            <tr>
                                <td>Gambar orang
                                <td rowspan="3" colspan="2"><%=rset.getString("conversationContent")%>

                            </tr>
                            <tr>
                                <td><%=rset.getString("sender")%>

                            </tr>
                            <tr>
                                <td><%=rset.getString("userType")%>                
                            </tr>
                            <tr>
                                <td>
                                <td>
                                <td align="right">#<%=rset.getString("conversationId")%>
                            </tr>
                            <tr>
                                <td>
                                <td>Replied on:
                                <td><%=rset.getString("conversationDate")%>
                            </tr>
                            <%
                                    }
                                }
                            %>
                            <tr>
                                <td>
                                <td colspan="2"><button id="myBtn">Reply to thread</button>
                            </tr>
                        </table>
                        <div id="myModal" class="modal">

                            <!-- Modal content -->
                            <div class="modal-content">
                                <span class="close">&times;</span>
                                <p>
                                <h1>Reply to: <%=fTitle%></h1>
                                <form action="forumReply">
                                    <%
                                        out.print("<input type=\"text\" name=\"forumId\" value=" + fId + " hidden>");
                                    %>
                                    <textarea name="reply"></textarea>
                                    <input type="submit" value="reply">
                                </form>
                                </p>
                            </div>

                        </div>
                    </section>
                </div>
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
