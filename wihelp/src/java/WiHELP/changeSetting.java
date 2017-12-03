/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WiHELP;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ikmal
 */
public class changeSetting extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        String user = (String) session.getAttribute("userSession");
        String user2 = (String) session.getAttribute("userSessionName");
        String user3 = (String) session.getAttribute("userType");
        
        PrintWriter out = response.getWriter();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = null;
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
            //          if(!connection.isClosed())
            //               out.println("Successfully connected to " + "MySQL server using TCP/IP...");
            //          connection.close();
            String sql = "Select setting from patient where username='" + user + "'";
            Statement stmnt = null;
            stmnt = conn.createStatement();
            ResultSet rset = null;
            String setting = null;
            rset = stmnt.executeQuery(sql);            
            while (rset.next()) {
                setting = rset.getString("setting");               
            }
            
            String sql2 = "";
            if(setting.equals("anonymous")){
                sql2 = "Update patient set setting = 'visible' where username='"+user+"'";
                
            }
            else if(setting.equals("visible")){
               sql2 = "Update patient set setting = 'anonymous' where username='"+user+"'";
                
            }
            Statement stmnt2 = null;
            out.print(sql2);
            stmnt2 = conn.createStatement();
            stmnt2.executeUpdate(sql2);
            
            response.sendRedirect("homepage/homeview.jsp");

        } catch (Exception ex) {
            out.println("Unable to connect to database.");
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
