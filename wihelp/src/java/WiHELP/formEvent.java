/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WiHELP;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yanaramli22
 */
public class formEvent extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        Statement stmt1 = null;
        PreparedStatement stmt2 = null;
        
        ResultSet rset = null;
        
        String eventName = request.getParameter("eventName");
        String eventDate = request.getParameter("eventDate");
        String eventLocation = request.getParameter("eventLocationName");
        String eventPosition = request.getParameter("eventLocationPos");
        String description = request.getParameter("description");       
     
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
            
            String sql1 = "Select * from event";
            stmt1 = conn.createStatement();
            rset = stmt1.executeQuery(sql1);
            
            int count = 1;
            while(rset.next()){
                count++;
            }
            
            
            String sql2 = "INSERT into event values (?,?,?,?,?,?)";
            stmt2 = conn.prepareStatement(sql2);
            
            stmt2.setString(1, String.valueOf(count));
            stmt2.setString(2, eventName);
            stmt2.setString(3, eventDate);
            stmt2.setString(4, eventLocation);
            stmt2.setString(5, eventPosition);
            stmt2.setString(6, description);
            
            stmt2.executeUpdate();
            out.print("test");
            response.sendRedirect("listevent.jsp");
            
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(formEvent.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(formEvent.class.getName()).log(Level.SEVERE, null, ex);
        }
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
