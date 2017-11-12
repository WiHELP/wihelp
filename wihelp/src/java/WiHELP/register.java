package WiHELP;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ikmal
 */
public class register extends HttpServlet {

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
        
        PreparedStatement stmt = null;
        PreparedStatement stmt2 = null;
        String user = request.getParameter("userType");
        String name = request.getParameter("name");
        int age = Integer.valueOf(request.getParameter("age"));
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String license = request.getParameter("license");
        
        try (PrintWriter out = response.getWriter()) {

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
               "jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
           
            boolean stat = false;
            if(user.equals("patient")){
                
                String sql = "INSERT into user values(?,?,?,?,?)";
                stmt = conn.prepareStatement(sql);
                
                stmt.setString(1, username);
                stmt.setString(2, password);
                stmt.setString(3, name);
                stmt.setString(4,email);
                stmt.setInt(5, age);
                
                stmt.executeUpdate();
                
                String sql2 = "INSERT into patient values(?,?)";
                stmt2 = conn.prepareStatement(sql2);
                
                stmt2.setString(1, username);
                stmt2.setString(2, address);
               
                stmt2.executeUpdate();
                
                stat = true;
            }
            else if(user.equals("counselor")){
                String sql = "INSERT into counselorpending values(?,?,?,?,?,?,?)";
                stmt = conn.prepareStatement(sql);
                
                stmt.setString(1, username);
                stmt.setString(2, password);
                stmt.setString(3, name);
                stmt.setInt(4, age);
                stmt.setString(5, email);
                stmt.setString(6, license);
                stmt.setString(7, "Pending");
                
                int row1 = stmt.executeUpdate();
                
                stat = true;
            }
            
            if(stat == true){
                
                response.sendRedirect("Login.html");
            }
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
