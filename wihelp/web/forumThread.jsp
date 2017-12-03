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
        <link rel="stylesheet" href="assets/css/main.css" />
        <title>JSP Page</title>
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
    </head>
    <body>

        <div class="wrapper">
            <div class="inner">



                <h2 class="major"><%=fTitle%></h2>

                <%
                    while (rset.next()) {
                        if (rset.isFirst()) {


                %>
                <table style="margin-bottom:5px;">
                    <tr>
                        <td rowspan="3" style="width:200px">
                            <img style="height:auto;width:auto;max-height:150px;max-width:150px;"src="images/user.jpg"><br>
                            <%=rset.getString("sender")%><br>
                            <%=rset.getString("userType")%>
                        <td colspan="3"><%=rset.getString("conversationContent")%>
                    </tr>                  
                    <tr>                        
                        <td>Created on:
                        <td><%=rset.getString("startDate")%>
                        <td align="right">#<%=rset.getString("conversationId")%>
                    </tr>                                                
                </table>                 
                <%
                } else {
                %>
                <table style="margin-bottom:5px">
                    <tr>
                        <td rowspan="3" style="width:200px">
                            <img style="height:auto;width:auto;max-height:150px;max-width:150px;"src="images/user.jpg"><br>
                            <%=rset.getString("sender")%><br>
                            <%=rset.getString("userType")%>
                        <td colspan="3"><%=rset.getString("conversationContent")%>

                    </tr>  
                    <tr>
                         <td>Replied on:
                        <td><%=rset.getString("conversationDate")%>
                        <td align="right">#<%=rset.getString("conversationId")%>
                    </tr>                       
                </table>
                <%
                        }
                    }
                %>

                <div class="row unifrom inner">
                    <button id="myBtn" style="padding-right:20px;margin-right:5px">Reply to thread</button>
                    <a href="forum.jsp" class="button">Back</a>
                </div>


                <div id="myModal" class="modal">

                    <!-- Modal content -->
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <p>
                        <h1>Reply to: <%=fTitle%></h1>
                        <form action="forumReply">
                            <%
                                out.print("<input type=\"hidden\" name=\"forumId\" value=" + fId + ">");
                            %>
                            <textarea style="margin-bottom:5px" name="reply"></textarea>
                            <input type="submit" value="reply">
                        </form>
                        </p>
                    </div>

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
