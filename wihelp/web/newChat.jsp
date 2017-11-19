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
            
            String user = (String) session.getAttribute("userSession");
            String sendTo = request.getParameter("sendto");
            String newMessage = request.getParameter("newMessage");
            Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

            ResultSet rset = null;
            ResultSet rset1 = null;
            ResultSet rset2 = null;

            int count = 1;
            int count2 = 1;
            int count3 = 0;
            int row = 0;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
                //          if(!connection.isClosed())
                //               out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                //          connection.close();
                String sql = "SELECT * FROM chat where sender = '" + user + "' and receiver = '" + sendTo + "' or sender = '"+sendTo+"' and receiver = '"+user+"'";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);

                String sql1 = "Select distinct chatId,sender,receiver from chat";
                Statement stmnt1 = null;
                stmnt1 = conn.createStatement();
                rset1 = stmnt1.executeQuery(sql1);

                String sql2 = "Select distinct chatId from chat";
                Statement stmnt2 = null;
                stmnt2 = conn.createStatement();
                rset2 = stmnt2.executeQuery(sql2);

                while (rset.next()) {
                    count++;
                }
                rset = stmnt.executeQuery(sql);
                while (rset2.next()) {
                    count2++;
                }
                boolean newChat = false;
                boolean newChat2 = false;
                if (count == 1) {
                    newChat = true;
                }

                if (newChat == true) {
                    row = count2;
                } else {
                    while (rset1.next()) {
                        count3++;
                        if (rset1.getString("sender").equals(user) && rset1.getString("receiver").equals(sendTo)) {
                            row = count3;
                            break;
                        }
                    }
                }

                out.print(row + "<br>");
                out.print(count + "<br>");
                out.print(date + "<br>");
                out.print(newMessage + "<br>");
                out.print(user + "<br>");
                out.print(sendTo + "<br>");

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
            String finalCount = "";
            if (testMessage == true) {

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = null;
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
                    String sql3 = "insert into chat values (?,?,?,?,?,?)";
                    PreparedStatement stmnt = null;
                    stmnt = conn.prepareStatement(sql3);

                    if(count <10)
                        finalCount = "000000000"+String.valueOf(count);
                    else if(count <100)
                        finalCount = "00000000"+String.valueOf(count);
                    else if(count <1000)
                        finalCount = "0000000"+String.valueOf(count);
                    else if(count <10000)
                        finalCount = "000000"+String.valueOf(count);
                    else if(count <100000)
                        finalCount = "00000"+String.valueOf(count);
                    else if(count <1000000)
                        finalCount = "0000"+String.valueOf(count);
                    else if(count <10000000)
                        finalCount = "000"+String.valueOf(count);
                    else if(count <100000000)
                        finalCount = "00"+String.valueOf(count);
                    else if(count <1000000000)
                        finalCount = "0"+String.valueOf(count);
                    
                    stmnt.setString(1, String.valueOf(row));
                    stmnt.setString(2, finalCount);
                    stmnt.setString(3, newMessage);
                    stmnt.setTimestamp(4, date);
                    stmnt.setString(5, user);
                    stmnt.setString(6, sendTo);

                    stmnt.executeUpdate();

                    String sql = "SELECT * FROM chat where sender = '" + user + "' and receiver = '" + sendTo + "' or sender = '"+sendTo+"' and receiver = '"+user+"'";
                    Statement stmnt1 = null;
                    stmnt1 = conn.createStatement();
                    rset = stmnt1.executeQuery(sql);

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
                <%out.print(rset.getString("conversationContent"));%>
            </div>
            <%
                }

            %>

        </div>
        <div>
            <form action="newChat.jsp">
                <%                    out.print("<input type=\"text\" name=\"sendto\" value=\"" + sendTo + "\" hidden>  ");
                %>

                <input type="text" id="messagetxt" name="newMessage">  
                <input type="submit" hidden>
            </form>
        </div>
    </body>
</html>
