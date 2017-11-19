<%-- 
    Document   : chat
    Created on : Nov 13, 2017, 10:52:09 PM
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
        <title>One-to-One Communication</title>

        

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
                background-color: #fefefe;
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

            String user = (String) session.getAttribute("userSession");

            ResultSet rset = null;
            ResultSet rset2 = null;
            int isOnly = 0;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
                //          if(!connection.isClosed())
                //               out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                //          connection.close();
                String sql = "Select distinct receiver,conversationContent,conversationDate from chat where sender ='" + user + "' ";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);

                while (rset.next()) {
                    isOnly++;
                }
                rset = stmnt.executeQuery(sql);

                Statement stmnt2 = null;
                String sql2 = "Select name from user join counselor on user.username = counselor.username";
                stmnt2 = conn.createStatement();
                rset2 = stmnt2.executeQuery(sql2);

            } catch (Exception ex) {
                out.println("Unable to connect to database.");
            }
        %>

    </head>
    <body>
        <!--Header section-->
        <section class="banner" role="banner">
            <header id="header">
                <div class="header-content clearfix"> <a class="logo" href="homepage.html">WiHELP</a>
                    <nav class="navigation" role="navigation">
                    <ul class="primary-nav">
                        <li><a href="homeview.jsp">Home</a></li>
                        <li class="tab active"><a href="/WiHELP/chat.jsp">One-to-One Conversation</a></li>
                        <li><a href="">Forum</a></li>
                        <li><a href="">Share Event</a></li>
                        <li><a href="">Screening Test</a></li>
                    </ul>
                    </nav>
                <a href="#" class="nav-toggle">Menu<span></span></a> 
                </div>
            </header>
        
        
        <h1>One-to-one Conversation</h1>
        <button id="myBtn">New chat</button>

        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <p>
                    <%
                        while (rset2.next()) {
                            String to = rset2.getString("name");
                            out.print("<a href=newChat.jsp?sendto=" + to + "><button>" + to + "</button></a>");
                        }
                    %>
                </p>
            </div>

        </div>
        <table border="1">
            <%
                String receiver = "";
                String prevTemp = "";
                Timestamp prevDate = null;
                String prevChat = "";
                int count = 0;
                //out.print(isOnly + "<br>");

                while (rset.next()) {
                    String temp = rset.getString("receiver");
                    Timestamp date = rset.getTimestamp("conversationDate");
                    String chat = rset.getString("conversationContent");

                    
                //    out.print(count + " " + prevTemp + " " + temp + "<br>");
                    if (!prevTemp.equals(temp)) {
                        count++;
                        if (count == 1) {

                            receiver = temp;
                            prevTemp = temp;
                            prevDate = date;
                            prevChat = chat;
                            continue;
                        }


            %>
            <tr>
                <td rowspan="2"><image src="" alt="Gambar orang">
                <td><%=prevTemp%>
                <td><%=prevDate%>
            </tr>
            <tr>
                <td colspan="2"><%=prevChat%>
            </tr>
            <%

                receiver = temp;

            } else if (rset.isLast()) {
            %>
            <tr>
                <td rowspan="2"><image src="" alt="Gambar orang">
                <td><%=temp%>
                <td><%=date%>
            </tr>
            <tr>
                <td colspan="2"><%=chat%>
            </tr>
            <%
                    }

                    prevTemp = temp;
                    prevDate = date;
                    prevChat = chat;
                }
            %>
        </table>
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
