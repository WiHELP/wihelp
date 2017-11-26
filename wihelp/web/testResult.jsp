<%-- 
    Document   : testResult
    Created on : Nov 24, 2017, 2:42:11 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
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
                <h2><a href="homepage/homeview.jsp">WiHELP</a></h2>
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
            
            
        
        <%

            int stress = 0;
            int anxiety = 0;
            int depression = 0;
            String result1="";
            String result2="";
            String result3=""; 
            int i = 1;
            int answer[] = new int[22];
            for (int a = 1; a < 22; a++) {
                answer[a] = Integer.parseInt(request.getParameter("r[" + a + "]"));
            }
        %>

        <%
        //       for(int b=1; b<22; b++){
        //           out.print(answer[b]+"<br>");
       //        }
            
            for (int c = 1; c < 22; c++) {
                if (c == 1 || c == 6 || c == 8 || c == 11 || c == 12 || c == 14 || c == 18) {
                   stress+=answer[c];
                //   out.print("stress");
                }
                else if (c == 2 || c == 4 || c == 7 || c == 9 || c == 15 || c == 19 || c == 20) {
                   anxiety+=answer[c];
                //   out.print("anxiety");
                }
                else if (c == 3 || c == 5 || c == 10 || c == 13 || c == 16 || c == 17 || c == 21) {
                   depression+=answer[c];
                //   out.print("depression");
                }
            }

          //  out.print(stress+"<br>"+anxiety+"<br>"+depression+"<br>");
            if (stress < 8)
            {
                result1 = "Normal";
            }
            else if (stress < 10)
            {
                result1  = "Mild";
            }
            
            else if (stress <14)
            {
                result1 = "Moderate";
            }
            
            else if (stress < 18)
            {
                result1 = "Severe";
            }
            
            else if (stress >= 18)
            {
                result1 = "Extremely severe";
            }
            
            if (anxiety < 5)
            {
                result2 = "Normal";
            }
            else if (anxiety < 7)
            {
                result2  = "Mild";
            }
            
            else if (anxiety < 9)
            {
                result2 = "Moderate";
            }
            
            else if (anxiety < 11)
            {
                result2 = "Severe";
            }
            
            else if  (anxiety >= 11)
            {
                result2 = "Extremely severe";
            }
            
            if (depression < 6)
            {
                result3 = "Normal";
            }
            else if (depression < 8)
            {
                result3  = "Mild";
            }
            
            else if (depression < 11)
            {
                result3 = "Moderate";
            }
            
            else if (depression < 15)
            {
                result3 = "Severe";
            }
            
            else if (depression >= 15)
            {
                result3 = "Extremely severe";
            }
            
            
            //out.print("Stress Score: " + stress + " [" + result1 + "]<br>");
            //out.print("Anxiety Score: " + anxiety + " [" + result2 + "]<br>");
            //out.print("Depression Score: " + depression + " [" + result3 + "]<br>");
        %>
        
        <div class="wrapper">
            <div class="inner">
                <section>
                    <h2> RESULT OF DEPRESSION ANXIETY STRESS SOCRE TEST </h2>
                    <div class="table-wrapper">
                        <table class="alt">
                            <thead>
                            <tr>
                                <th> </th>
                                <th> Stress </th>
                                <th> Anxiety </th>
                                <th> Depression </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td> Score </td>
                                <td> <%=stress%> </td>
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
            </div>
      
        </div>
        </div>    
        
    </body>
</html>

        