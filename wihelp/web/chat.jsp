<%-- 
    Document   : chat
    Created on : Nov 13, 2017, 10:52:09 PM
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
         String user = (String)session.getAttribute(userSession);
         
         
        ResultSet rset = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");          
            Connection conn = null; 
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
 //          if(!connection.isClosed())
 //               out.println("Successfully connected to " + "MySQL server using TCP/IP...");
 //          connection.close();
            String sql = "Select chatid from chat where sender ='"+user+"' ";
            Statement stmnt = null;
            stmnt = conn.createStatement();
            rset = stmnt.executeQuery(sql);
 
        }catch(Exception ex){
        out.println("Unable to connect to database.");
        }
%>
        
    </head>
    <body>
        <h1>One-to-one Conversation</h1>
        <table border="1">
        <%
            while(rset.next()){
               %>
               <tr>
                   <td rowspan="2"><image src="" alt="Gambar orang">
                   <td><%rset.getString("receiver");%>
                   <td>
                <% 
            }
        %>
    </body>
</html>
