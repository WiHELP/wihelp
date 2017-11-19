<%-- 
    Document   : chatCounselor
    Created on : Nov 18, 2017, 9:36:59 PM
    Author     : Ikmal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            String userSession = new String();
            String user = (String) session.getAttribute(userSession);

            ResultSet rset = null;
            ResultSet rset2 = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
                //          if(!connection.isClosed())
                //               out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                //          connection.close();
                String sql = "Select distinct sender,conversationContent,conversationDate from chat where receiver ='" + user + "' ";
                Statement stmnt = null;
                stmnt = conn.createStatement();
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
        <h1>Hello World!</h1>
    </body>
</html>
