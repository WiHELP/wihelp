<%-- 
    Document   : forum
    Created on : Nov 23, 2017, 5:12:51 PM
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
        <title>JSP Page</title>
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
                background-color: #fefefe;
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
            ResultSet rset = null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
                String sql = "SELECT * FROM forum join forumdetails on forum.forumId = forumdetails.forumId";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);
            }
            catch(Exception e){
                e.printStackTrace();
            }
        %>
    </head>
    <body>
        <div>
            <h1>Forum</h1>
            <button id="myBtn">New chat</button>

            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <form action="createForum">
                        Forum title:<input type="text" name="forumtitle">
                        Forum body:<input type="textarea" name="forumContent">
                        
                        <input type="submit">
                    </form>
                </div>

            </div>
            <table>                
            <%
                String forumid = "";
                while(rset.next()){
                    if(!forumid.equals(rset.getString("forumId"))){
                        %>
                            <tr>
                                <td rowspan="2"><%=rset.getString("forumTitle")%>
                                <td>Start date: <%=rset.getString("startDate")%>
                            </tr>
                            <tr>
                                <td>Start by: <%=rset.getString("startUser")%>
                            </tr>
                        <%
                    }
                }
            %>
            </table>
        </div>
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
