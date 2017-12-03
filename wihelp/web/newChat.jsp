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
        <link rel="stylesheet" href="assets/css/main.css" />

        <%

            String user = (String) session.getAttribute("userSession");
            String user2 = (String) session.getAttribute("userSessionName");
            String sendTo = request.getParameter("sendto");
            String sendTo2 = request.getParameter("sendto2");
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
                String sql = "SELECT * FROM chat where sender = '" + user + "' and receiver = '" + sendTo + "' or sender = '" + sendTo + "' and receiver = '" + user + "'";
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
                    newChat = true; //kiranya dua pihak belom pernah start conversation with each other
                }

                if (newChat == true) {
                    row = count2;  //bg kat dia chatid baru
                } else {
                    String prevSender = "";
                    String prevReceiver = "";
                    while (rset1.next()) {

                        if (rset1.getString("sender").equals(prevSender) && rset1.getString("receiver").equals(prevReceiver) || rset1.getString("receiver").equals(prevSender) && rset1.getString("sender").equals(prevReceiver)) {
                            row = count3;
                            continue;
                        }
                        count3++;
                        if (rset1.getString("sender").equals(user) && rset1.getString("receiver").equals(sendTo) || rset1.getString("receiver").equals(user) && rset1.getString("sender").equals(sendTo)) {
                            row = count3;
                            break;
                        }
                        prevSender = rset1.getString("sender");
                        prevReceiver = rset1.getString("receiver");
                    }
                }

                //        out.print(row + "<br>");
                //        out.print(count + "<br>");
                //        out.print(date + "<br>");
                //        out.print(newMessage + "<br>");
                //        out.print(user + "<br>");
                //        out.print(sendTo2 + "<br>");
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

                    if (count < 10) {
                        finalCount = "000000000" + String.valueOf(count);
                    } else if (count < 100) {
                        finalCount = "00000000" + String.valueOf(count);
                    } else if (count < 1000) {
                        finalCount = "0000000" + String.valueOf(count);
                    } else if (count < 10000) {
                        finalCount = "000000" + String.valueOf(count);
                    } else if (count < 100000) {
                        finalCount = "00000" + String.valueOf(count);
                    } else if (count < 1000000) {
                        finalCount = "0000" + String.valueOf(count);
                    } else if (count < 10000000) {
                        finalCount = "000" + String.valueOf(count);
                    } else if (count < 100000000) {
                        finalCount = "00" + String.valueOf(count);
                    } else if (count < 1000000000) {
                        finalCount = "0" + String.valueOf(count);
                    }

                    stmnt.setString(1, String.valueOf(row));
                    stmnt.setString(2, finalCount);
                    stmnt.setString(3, newMessage);
                    stmnt.setTimestamp(4, date);
                    stmnt.setString(5, user);
                    stmnt.setString(6, sendTo);

                    stmnt.executeUpdate();

                    String sql = "SELECT * FROM chat where sender = '" + user + "' and receiver = '" + sendTo + "' or sender = '" + sendTo + "' and receiver = '" + user + "'";
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
        <div class="wrapper">
            <div class="inner" style="">
                <div class="row uniform">
                    <h1 class="major 10u">Counselor : <%=sendTo2%></h1>
                    <div class="2u">
                        <a href="chat.jsp" class="button">Back</a>
                    </div>
                </div>
                <div style="height:500px;width:100%;overflow-y:scroll;display: inline-block;">
                    <%
                        while (rset.next()) {
                    %>
                    <%                        
                       if (user.equals(rset.getString("sender"))) {
                    %>
                    <div style="direction:rtl;">
                    <div style="border-radius:5px;display:inline-block;padding-right:5px;margin:2px;padding-left:5px;background-color:white;color:black;">
                        <%out.print(rset.getString("conversationContent"));%>
                    </div>    
                    </div>

                    <%
                    } else {
                    %>
                    <div style="direction:ltr;">
                    <div style="border-radius:5px;display:inline-block;padding-right:5px;margin:2px;padding-left:5px;background-color:white;color:black;">
                        <%out.print(rset.getString("conversationContent"));%>
                    </div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <div>
                    <%                        out.print("<form action=\'newChat.jsp?sendto=" + sendTo + "&sendto2=" + sendTo2 + "\'>");
                    %>

                    <%                    out.print("<input type=\"hidden\" name=\"sendto\" value=\"" + sendTo + "\">  ");
                        out.print("<input type=\"hidden\" name=\"sendto2\" value=\"" + sendTo2 + "\">  ");
                    %>

                    <input type="text" autocomplete="off" id="messagetxt" name="newMessage">  
                    <input type="submit" hidden>
                    </form>


                </div>
            </div>
        </div>
    </body>

    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.scrollex.min.js"></script>
    <script src="assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="assets/js/main.js"></script>
</html>
