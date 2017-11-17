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
            Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

            ResultSet rset = null;
            ResultSet rset2 = null;

            int count = 0;
            int count2 = 0;
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

                String sql2 = "Select distinct chatId from chat";
                Statement stmnt2 = null;
                stmnt2 = conn.createStatement();
                rset2 = stmnt2.executeQuery(sql2);

                while (rset.next()) {
                    count++;
                }
                while (rset2.next()) {
                    count2++;
                }
                out.print(count + "<br>");
                out.print(count2 + "<br>");
                out.print(date + "<br>");
                out.print(newMessage + "<br>");
                out.print(user + "<br>");
                out.print(sendTo + "<br>");

                boolean newChat = false;
                boolean newChat2 = false;
                if (count == 0) {
                    newChat = true;
                }

            } catch (Exception ex) {
                out.println("Unable to connect to database.");
            }
            //  out.print(newMessage);
            boolean testMessage = false;
            if (newMessage == null || newMessage.trim().length() == 0) {
                testMessage = false;
            } else {
                testMessage = true;
            }

            if (testMessage == true) {

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = null;
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
                    String sql3 = "insert into chat values (?,?,?,?,?,?)";
                    PreparedStatement stmnt = null;
                    stmnt = conn.prepareStatement(sql3);

                    stmnt.setString(1, String.valueOf(count2));
                    stmnt.setString(2, String.valueOf(count));
                    stmnt.setString(3, newMessage);
                    stmnt.setTimestamp(4, date);
                    stmnt.setString(5, user);
                    stmnt.setString(6, sendTo);
                    
                    stmnt.executeUpdate();

                } catch (Exception ex) {
                    out.println("Unable to send message.");
                }
            }


        %>
    </head>
    <%
    %>
    <body>
        <h1>Counselor : <%=sendTo%></h1>
        <div>
            <%
                while (rset.next()) {

            %>
            <div>
                <%                    out.print("content");                         %>
            </div>
            <%
                }

            %>

        </div>
        <div>
            <form action="newChat.jsp">
                <%                    out.print("<input type=\"text\" name=\"sendto\" value=\"" + sendTo + "\" hidden>  ");
                %>

                <input type="text" name="newMessage">  
                <input type="submit" hidden>
            </form>
        </div>
    </body>
</html>
