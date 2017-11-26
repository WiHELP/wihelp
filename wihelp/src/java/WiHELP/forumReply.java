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
public class forumReply extends HttpServlet {

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
         ResultSet rset = null;
            String reply = request.getParameter("reply"); 
            String fId = request.getParameter("forumId"); 
            Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
            String user = (String) session.getAttribute("userSession");
            PrintWriter out = response.getWriter();
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");
                //          if(!connection.isClosed())
                //               out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                //          connection.close();
                String sql = "SELECT * FROM forum join forumdetails on forum.forumId = forumdetails.forumId where forum.forumId ='"+fId+"'";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);
                String title = "";
                int count = 1;
                while(rset.next()){
                    title = rset.getString("forumTitle");
                    count++;
                }
                out.print(fId+"<br>"+count+"<br>"+reply+"<br>"+date+"<br>"+user);
                
                String sql2 = "insert into forum value(?,?,?,?,?)";
                PreparedStatement stmnt2 = conn.prepareStatement(sql2);
                
                stmnt2.setString(1, fId);
                stmnt2.setString(2, String.valueOf(count));
                stmnt2.setString(3, reply);
                stmnt2.setTimestamp(4, date);
                stmnt2.setString(5, user);
                
                stmnt2.executeUpdate();
                
                response.sendRedirect("forumThread.jsp?forumid="+fId+"&forumtitle="+title);
                
            } catch (Exception e) {
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
