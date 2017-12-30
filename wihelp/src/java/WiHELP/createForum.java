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
public class createForum extends HttpServlet {

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
        ResultSet rset = null;
        ResultSet rset2 = null;
        Statement stmnt = null;
        PreparedStatement stmnt2 = null;
        PreparedStatement stmnt3 = null;
        
        HttpSession session = request.getSession(true);
        String user = (String) session.getAttribute("userSession");
        String title = request.getParameter("forumTitle");
        String body = request.getParameter("forumContent");
        Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        
        
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
                String sql = "select distinct forumId from forum";   
                
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);
                
                int count = 1;
                
                while(rset.next()){
                    count++;
                }
                out.print(count+"<br>"+user+"<br>"+title+"<br>"+body+"<br>"+date+"<br>");
                
                String sql2 = "insert into forum values(?,?,?,?,?)";
                stmnt2 = conn.prepareStatement(sql2);
                stmnt2.setString(1,String.valueOf(count));
                stmnt2.setString(2,String.valueOf(1));
                stmnt2.setString(3,String.valueOf(body));
                stmnt2.setTimestamp(4,date);
                stmnt2.setString(5,user);
                stmnt2.executeUpdate();
                
                
                String sql3 = "insert into forumdetails values(?,?,?,?)";
                stmnt2 = conn.prepareStatement(sql3);
                stmnt2.setString(1,String.valueOf(count));
                stmnt2.setString(2,String.valueOf(title));
                stmnt2.setTimestamp(3,date);                
                stmnt2.setString(4,user);

                stmnt2.executeUpdate();
                response.sendRedirect("forum.jsp");
                
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
