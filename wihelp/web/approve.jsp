<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<html>
    <head>
        
        <%!
            public ResultSet sql(){
                
                Statement stmt = null;
                ResultSet rset = null;

                try{
                    Class.forName("com.mysql.jdbc.Driver");
           
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sys?useSSL=false", "root", "1234");
                    stmt = conn.createStatement();
            
                   String str1 = "select * from counselorpending";
                   rset = stmt.executeQuery(str1);
                   
                }
                catch(Exception e){
                    e.printStackTrace();
                }
                return rset;
            }
        %>
        
        <title>Approval</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container container-fluid">
            <div align="center" class="jumbotron">
                <h1><b><font color="black" style="font-family: fantasy;">WiHELP</font> </b></h1>
            </div>
            <div class="panel panel-body">
                <div>
                    <table class="table">
                        <%
                            while(rset.next()){
                                
                            }
                        %>
                    </table>
                </div>
                <div>
                    
                </div>
            <div>
        </div>
    </body>
</html>
