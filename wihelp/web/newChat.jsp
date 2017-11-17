<%-- 
    Document   : newChat
    Created on : Nov 16, 2017, 10:01:34 PM
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
            String sendTo = request.getParameter("sendto");
            String newMessage = request.getParameter("newMessage");

            ResultSet rset = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
                //          if(!connection.isClosed())
                //               out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                //          connection.close();
                String sql = "SELECT * FROM chat where sender = '" + user + "' and receiver = '" + sendTo + "'";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);

            } catch (Exception ex) {
                out.println("Unable to connect to database.");
            }
          //  out.print(newMessage);
            boolean testMessage = false;
            if(newMessage == null || newMessage.equals("")){
                testMessage = false;
            }
            else
                testMessage = true;
            
            if(testMessage == true)
             out.print("cubaan run sql");
        %>
    </head>
    <%

    %>
    <body>
        <h1>Counselor : <%=sendTo%></h1>
        <div>
            <%
                while (rset.next()) {
                    String content = rset.getString("conversationContent");
            %>
            <div>
                <%
                    out.print("content");
                %>
            </div>
            <%
                }
                
            %>

        </div>
        <div>
            <form action="newChat.jsp">
                <%
                    out.print("<input type=\"text\" name=\"sendto\" value=\""+sendTo+"\" hidden>  ");
                %>
                
                <input type="text" name="newMessage">  
                <input type="submit" hidden>
            </form>
        </div>
    </body>
</html>
