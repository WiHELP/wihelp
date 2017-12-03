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
import javax.servlet.http.*;

/**
 *
 * @author User
 */
public class testResult extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        
        int stress = 0;
        int anxiety = 0;
        int depression = 0;
        String result1 = "";
        String result2 = "";
        String result3 = "";
        int i = 1;
        int answer[] = new int[22];
        for (int a = 1; a < 22; a++) {
            answer[a] = Integer.parseInt(request.getParameter("r[" + a + "]"));
        }
  //      for(int b=1; b<22; b++){
  //                 out.print(answer[b]+"<br>");
  //            }
            
        for (int c = 1; c < 22; c++) {
            if (c == 1 || c == 6 || c == 8 || c == 11 || c == 12 || c == 14 || c == 18) {
                stress += answer[c];
                //   out.print("stress");
            } else if (c == 2 || c == 4 || c == 7 || c == 9 || c == 15 || c == 19 || c == 20) {
                anxiety += answer[c];
                //   out.print("anxiety");
            } else if (c == 3 || c == 5 || c == 10 || c == 13 || c == 16 || c == 17 || c == 21) {
                depression += answer[c];
                //   out.print("depression");
            }
        }

        //  out.print(stress+"<br>"+anxiety+"<br>"+depression+"<br>");
        

        PreparedStatement stmt = null;
        HttpSession session = request.getSession(true);
        String user = (String) session.getAttribute("userSession");
        

        
        //out.print(user);
        out.print("test");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/wihelp?useSSL=false", "root", "1234");

            String sql = "INSERT into testresult values (?,?,?,?)";
            stmt = conn.prepareStatement(sql);
            
            stmt.setString(1, user);
            stmt.setInt(2, stress);
            stmt.setInt(3, anxiety);
            stmt.setInt(4, depression);
            
            
            stmt.executeUpdate();
            out.print("test");
            response.sendRedirect("testResult.jsp");

            

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


