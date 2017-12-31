<%-- 
    Document   : testResult
    Created on : Nov 24, 2017, 2:42:11 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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

        

        <%

            ResultSet rset = null;
            String user = (String) session.getAttribute("userSession");
            int stress = 0;
            int anxiety = 0;
            int depression = 0;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");

                String sql = "SELECT stress, anxiety, depression from testresult where username = '" + user + "'";
                Statement stmt = null;
                stmt = conn.createStatement();
                rset = stmt.executeQuery(sql);
                while (rset.next()) {
                    stress = rset.getInt("stress");
                    anxiety = rset.getInt("anxiety");
                    depression = rset.getInt("depression");
                }
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
                        <li><a href="logout">LogOut</a></li>
                    </ul>
                    <a href="#" class="close">Close</a>
                </div>
            </nav>
            <%
                String result1 = "";
                String result2 = "";
                String result3 = "";
                if (stress < 8) {
                    result1 = "Normal";
                } else if (stress < 10) {
                    result1 = "Mild";
                } else if (stress < 14) {
                    result1 = "Moderate";
                } else if (stress < 18) {
                    result1 = "Severe";
                } else if (stress >= 18) {
                    result1 = "Extremely severe";
                }

                if (anxiety < 5) {
                    result2 = "Normal";
                } else if (anxiety < 7) {
                    result2 = "Mild";
                } else if (anxiety < 9) {
                    result2 = "Moderate";
                } else if (anxiety < 11) {
                    result2 = "Severe";
                } else if (anxiety >= 11) {
                    result2 = "Extremely severe";
                }

                if (depression < 6) {
                    result3 = "Normal";
                } else if (depression < 8) {
                    result3 = "Mild";
                } else if (depression < 11) {
                    result3 = "Moderate";
                } else if (depression < 15) {
                    result3 = "Severe";
                } else if (depression >= 15) {
                    result3 = "Extremely severe";
                }

            %>

            <div class="wrapper">
                <div class="inner">
                    <section>
                        <h2> LEVEL OF SCORES </h2>
                        <div class="table-wrapper">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th> Level </th>
                                        <th> Stress Score </th>
                                        <th> Anxiety Score </th>
                                        <th> Depression Score </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td> Normal </td>
                                        <td> 0 - 7 </td>
                                        <td> 0 - 4 </td>
                                        <td> 0 - 5 </td>
                                    </tr>
                                    <tr>
                                        <td> Mild </td>
                                        <td> 8 - 9 </td>
                                        <td> 5- 6 </td>
                                        <td> 6 - 7 </td>
                                    </tr>
                                    <tr>
                                        <td> Moderate </td>
                                        <td> 10 - 13 </td>
                                        <td> 7 - 8 </td>
                                        <td> 8 - 10 </td>
                                    </tr>
                                    <tr>
                                        <td> Severe </td>
                                        <td> 14- 17 </td>
                                        <td> 9 - 10 </td>
                                        <td> 11 - 14 </td>
                                    </tr>
                                    <tr>
                                        <td> Extremely Severe </td>
                                        <td> More than 17 </td>
                                        <td> More than 10 </td>
                                        <td> More than 14 </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>

                    <section>
                        <h2> RESULT OF DEPRESSION ANXIETY STRESS SCORE TEST </h2>
                        <div class="table-wrapper">
                            <table class="alt">
                                <thead>
                                    <tr>
                                        <th> </th>
                                        <th> Stress Score </th>
                                        <th> Anxiety </th>
                                        <th> Depression </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td> Score </td>
                                        <td> <%= stress%> </td>
                                        <td> <%=anxiety%> </td>
                                        <td> <%=depression%> </td>
                                    </tr>
                                    <tr>
                                        <td> Level </td>
                                        <td> <%=result1%> </td>
                                        <td> <%=result2%> </td>
                                        <td> <%=result3%> </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                    <a href="dassTest.html" class="button">ANSWER SCREENING TEST AGAIN</a> &nbsp
                     <a href="homepage/homeview.jsp" class="button">Back</a>
                </div>



            </div>
        </div>    

    </body>
</html>


