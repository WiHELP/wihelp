/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WiHELP;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.sql.*;

/**
 *
 * @author Ikmal
 */
public class appCounselor extends HttpServlet {

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
        
        
        Statement stmt = null;
        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;
        PreparedStatement stmt3 = null;
        try{
            PrintWriter out = response.getWriter();
            Class.forName("com.mysql.jdbc.Driver");
           
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
            
            stmt = conn.createStatement();
            
            String sql = "Select * from counselorpending where license = '"+request.getParameter("license")+"'";
            //out.print(sql);
            ResultSet rset = stmt.executeQuery(sql);
            
            while(rset.next()){
                String sql1 = "INSERT into user values(?,?,?,?,?)";
                stmt1 = conn.prepareStatement(sql1);
                
                stmt1.setString(1, rset.getString("username"));
                stmt1.setString(2, rset.getString("password"));
                stmt1.setString(3, rset.getString("name"));
                stmt1.setString(4, rset.getString("email"));
                stmt1.setInt(5, rset.getInt("age"));
                
            stmt1.executeUpdate();
            out.print("test");
            String sql2 = "INSERT into counselor values(?,?)";
                stmt2 = conn.prepareStatement(sql2);
            
                stmt2.setString(1, rset.getString("username"));
                stmt2.setString(2, rset.getString("license"));
                
                stmt2.executeUpdate();
                
             String sql3 = "UPDATE counselorpending set status = ? where license = ?";
                stmt3 = conn.prepareStatement(sql3);
                
                stmt3.setString(1, "Approved");
                stmt3.setString(2, rset.getString("license"));
                
                stmt3.executeUpdate();
            }
            response.sendRedirect("approve");
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
