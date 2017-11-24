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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <%

            int stress = 0;
            int anxiety = 0;
            int depression = 0;
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

        %>

    </body>
</html>
