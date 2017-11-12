package WiHELP;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.*;

/**
 *
 * @author Ikmal
 */
public class approve extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Statement stmt = null;
        Statement stmt2 = null;
        String username = "";
       
        try{
            Class.forName("com.mysql.jdbc.Driver");
           
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
            stmt = conn.createStatement();
            stmt2 = conn.createStatement();
            
            String str1 = "select * from counselorpending";
            ResultSet rset = stmt.executeQuery(str1);
            
            String str2 = "select * from lkm";
            
            
            out.print("<head>"
                        + "<link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n" +
"    </head>"
                        + "<body>\n" +
"        <div class=\"container container-fluid\">\n" +
"            <div align=\"center\" class=\"jumbotron\">\n" +
"                <h1><b><font color=\"black\" style=\"font-family: fantasy;\">WiHELP</font> </b></h1>\n" +
"            </div>\n" +
"            <div class=\"panel panel-body\">\n" +
"                <div class=\"col-md-10\">\n" +
"                    <table class=\"table\">\n");
                                        out.print("<tr>"
                                        + "<th>Name"
                                        + "<th>License"
                                        + "<th>Status"
                                        + "<th>Match found in LKM database"
                                        + "<th>Match found in LKM database"
                                        + "</tr>");
                            while(rset.next()){
                                
                                ResultSet rset2 = stmt2.executeQuery(str2);
                                String name = rset.getString("name");
                                String license = rset.getString("license");
                                String status = rset.getString("status");
                                out.print("<tr>"
                                        + "<td>"
                                        + name
                                        + "<td>"
                                        + license
                                        + "<td>"
                                        + status
                                        + "<td>");
                                        boolean test = false;
                                        while(rset2.next()){
                                            if(license.equals(rset2.getString("KB_No")))
                                                test = true;
                                        }
                                        if(test == true){
                                            out.print("Found");
                                        }
                                        else
                                            out.print("Not Found");
                                        
                                        if(status.equals("Pending"))
                                        out.print("<div class=\"\">"
                                                + "<td>"
                                                + "<form action=\"appCounselor\">"
                                                + "<input type=\"text\" name=\"license\" value="+license+" hidden></input>"
                                                + "<input type=\"submit\" value=\"Approve\"></input>"
                                                + "</form>"
                                                + "<form action=\"rejCounselor\">"
                                                + "<input type=\"text\" name=\"license\" value="+license+" hidden></input>"
                                                + "<input type=\"submit\" value=\"Reject\"></input>"
                                                + "</form>"
                                                + "</div>"
                                                + "</tr>");
                                        else if(status.equals("Approved"))
                                        out.print("<td>"
                                                + "APPROVED"
                                                + "</tr>");
                                        else if(status.equals("Rejected"))
                                        out.print("<td>"
                                                + "Rejected"
                                                + "</tr>");
                            }
        out.print("\n" +
"                    </table>\n" +
"                </div>\n" +
"                <div>\n" +
"                    \n" +
"                </div>\n" +
"            <div>\n" +
"        </div>\n" +
"    </body>");
             
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}

