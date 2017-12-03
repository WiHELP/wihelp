<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<!DOCTYPE HTML>
<!--
        Solid State by HTML5 UP
        html5up.net | @ajlkn
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
    <head>
        <title>WiHELP</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

        <%

            ResultSet rset = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");

                String sql = "SELECT eventName, eventDate, eventLocation, description from event";
                Statement stmt = null;
                stmt = conn.createStatement();
                rset = stmt.executeQuery(sql);

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
                        <li><a href="#">LogOut</a></li>
                    </ul>
                    <a href="#" class="close">Close</a>
                </div>
            </nav>

            <!-- Banner -->
            <section id="banner">
                <div class="inner">
                    <div class="logo"><span class=""></span></div>
                    <center><h2>SHARE EVENT</h2></center>
                    <center><p>You can share your event here by fill in the form</p></center>
                </div>
            </section>



            <!-- Content -->
            <div class="wrapper">
                <div class="inner">

                    <section>
                        <h2 class="major"><b>List Of Event </b></h2>
                        <div class="table-wrapper">
                            <table class="alt">
                                <thead>
                                    <tr>
                                        <th>Event Name</th>
                                        <th>Date</th> 
                                        <th>Description</th> 
                                        <th>Location</th>                                     
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        while (rset.next()) {
                                    %>

                                    <tr>
                                        <td><%=rset.getString("eventName")%></td>      
                                        <td><%=rset.getString("eventDate")%></td>
                                        <td><%=rset.getString("description")%></td>
                                        <td><a href="#"><%=rset.getString("eventLocation")%></a></td>

                                    </tr>
                                    <%
                                        }
                                    %>

                                </tbody>                                    
                            </table>
                            <ul class="actions">
                                <li><button id="myBtn" class="button">Share Event</button></li>
                            </ul>

                            <jsp:include page="formEvent.jsp"></jsp:include>

                    </section>                                        
                </div>
            </div>

        </section>



    </div>

</body>
</html>
