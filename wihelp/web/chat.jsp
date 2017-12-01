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

            String user = (String) session.getAttribute("userSession");
            String user2 = (String) session.getAttribute("userSessionName");
            String user3 = (String) session.getAttribute("userType");

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
                String sql = "Select distinct chatId,sender,receiver,conversationContent,conversationDate from chat where sender ='" + user + "' or receiver = '" + user + "'";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);

                while (rset.next()) {
                    isOnly++;
                }
                rset = stmnt.executeQuery(sql);

                Statement stmnt2 = null;
                String sql2 = "Select name,user.username from user join counselor on user.username = counselor.username";
                stmnt2 = conn.createStatement();
                rset2 = stmnt2.executeQuery(sql2);

            } catch (Exception ex) {
                out.println("Unable to connect to database.");
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
                    <center><h2>One-to-one Conversation</h2></center>
                    <center><p>Start your private conversation with your counselor by clicking at the button below.</p></center>
                </div>
            </section>


            <!-- Content -->
            <div class="wrapper">
                <div class="inner">

                    <section>
                        
                        <%
                            if (user3.equals("patient")) {
                        %>
                        <ul class="actions">
                            <li><center><button id="myBtn" class="">New chat</button></center></li>
                        </ul>                                                                        
                    </section>
                </div>

                <div id="myModal" class="modal">

                    <!-- Modal content -->
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <p>
                            <%
                                while (rset2.next()) {
                                    String to = rset2.getString("username");
                                    String to2 = rset2.getString("name");
                                    out.print("<a href=newChat.jsp?sendto=" + to + "&sendto2=" + to2 + "><button>" + to2 + "</button></a>");
                                }

                            %>
                        </p>
                    </div>

                </div>
                <%                        }
                %>
                <table border="1">
                    <%
                        String id = "";
                        String prevReceiver = "";
                        String name = "";
                        String prevSender = "";
                        String previd = "";
                        Timestamp prevDate = null;
                        String prevChat = "";
                        int count = 0;
                        //out.print(isOnly + "<br>");

                        while (rset.next()) {
                            String temp = rset.getString("chatId");
                            String receiver = rset.getString("receiver");
                            String sender = rset.getString("sender");
                            Timestamp date = rset.getTimestamp("conversationDate");
                            String chat = rset.getString("conversationContent");

                            //    out.print(count + " " + prevTemp + " " + temp + "<br>");
                            if (!previd.equals(temp)) {
                                count++;
                                if (count == 1) {

                                    id = temp;
                                    prevSender = sender;
                                    prevReceiver = receiver;
                                    previd = temp;
                                    prevDate = date;
                                    prevChat = chat;
                                    continue;
                                }


                    %>
                    <tr>
                        <td rowspan="2"><image src="" alt="Gambar orang">
                        <td><%                        if (prevReceiver.equals(user)) {
                                out.print(prevSender);
                            } else if (prevSender.equals(user)) {
                                out.print(prevReceiver);
                            }
                            %>
                        <td><%=prevDate%>
                    </tr>
                    <tr>
                        <td colspan="2"><%
                            if (prevReceiver.equals(user)) {
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = null;
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");

                                    Statement stmnt2 = null;
                                    String sql2 = "Select name from user where username = '" + prevSender + "'";
                                    stmnt2 = conn.createStatement();
                                    rset2 = stmnt2.executeQuery(sql2);

                                } catch (Exception ex) {
                                    out.println("Unable to connect to database.");
                                }
                                while (rset2.next()) {
                                    name = rset2.getString("name");
                                }
                                out.print("<a href=newChat.jsp?sendto=" + prevSender + "&sendto2=" + name + ">" + prevChat + "</a>");
                            } else if (prevSender.equals(user)) {
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = null;
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");

                                    Statement stmnt2 = null;
                                    String sql2 = "Select name from user where username = '" + prevReceiver + "'";
                                    stmnt2 = conn.createStatement();
                                    rset2 = stmnt2.executeQuery(sql2);

                                } catch (Exception ex) {
                                    out.println("Unable to connect to database.");
                                }
                                while (rset2.next()) {
                                    name = rset2.getString("name");
                                }
                                out.print("<a href=newChat.jsp?sendto=" + prevReceiver + "&sendto2=" + name + ">" + prevChat + "</a>");
                            }
                            %>

                    </tr>

                    <%
                        id = temp;

                    } else if (rset.isLast()) {
                    %>
                    <tr>
                        <td rowspan="2"><image src="" alt="Gambar orang">
                        <td><%
                            if (receiver.equals(user)) {
                                out.print(sender);
                            } else if (sender.equals(user)) {
                                out.print(receiver);
                            }
                            %>
                        <td><%=date%>
                    </tr>
                    <tr>
                        <td colspan="2"><%
                            if (receiver.equals(user)) {
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = null;
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");

                                    Statement stmnt2 = null;
                                    String sql2 = "Select name from user where username = '" + sender + "'";
                                    stmnt2 = conn.createStatement();
                                    rset2 = stmnt2.executeQuery(sql2);

                                } catch (Exception ex) {
                                    out.println("Unable to connect to database.");
                                }
                                while (rset2.next()) {
                                    name = rset2.getString("name");
                                }
                                out.print("<a href=newChat.jsp?sendto=" + sender + "&sendto2=" + name + ">" + chat + "</a>");
                            } else if (sender.equals(user)) {
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection conn = null;
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");

                                    Statement stmnt2 = null;
                                    String sql2 = "Select name from user where username = '" + receiver + "'";
                                    stmnt2 = conn.createStatement();
                                    rset2 = stmnt2.executeQuery(sql2);

                                } catch (Exception ex) {
                                    out.println("Unable to connect to database.");
                                }
                                while (rset2.next()) {
                                    name = rset2.getString("name");
                                }
                                out.print("<a href=newChat.jsp?sendto=" + receiver + "&sendto2=" + name + ">" + chat + "</a>");
                            }
                            %>
                    </tr>
                    <%
                            }

                            prevSender = sender;
                            prevReceiver = receiver;
                            previd = temp;
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
