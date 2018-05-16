/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author msi
 */
public class login extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental", "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM users WHERE username='" + username + "' AND password='" + password + "'");

                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    session.setAttribute("userid", rs.getString("user_id"));
                    session.setAttribute("lastname", rs.getString("lastname"));
                    session.setAttribute("firstname", rs.getString("firstname"));
                    session.setAttribute("email", rs.getString("email"));
                    session.setAttribute("contact", rs.getString("contact"));
                    session.setAttribute("address", rs.getString("address"));

                    if (!session.getAttribute("username").equals(null)) {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental", "root", "");
                        String query = "UPDATE users SET status = ? WHERE username = ?";
                        PreparedStatement pst = conn.prepareStatement(query);
                        pst.setString(1, "Active");
                        pst.setString(2, username);
                        pst.executeUpdate();
                        
                        response.sendRedirect("home.jsp");
                    }

                    
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid username or password')");
                    out.println("location='index.jsp';");
                    out.println("</script>");

                }

            } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {

            }
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
