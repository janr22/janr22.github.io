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

/**
 *
 * @author msi
 */
public class filter extends HttpServlet {

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
            try {
                String search = request.getParameter("search");
                String provider;
                String type;
                String model;
                String brand;
                String transition;
                String capacity;
                String price;
                byte[] image;

                Class.forName("com.mysql.jdbc.Driver").newInstance();
                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental", "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM cars WHERE type = '"
                        + search + "' OR  model = '"
                        + search + "' OR  brand = '"
                        + search + "' OR  transition = '"
                        + search + "' OR  capacity = '"
                        + search + "' OR  price = '"
                        + search + "' OR  provider = '"
                        + search + "'");
                if(rs == null){
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('no results found')");
                    out.println("location='/home.jsp';");
                    out.println("</script>");
                }
                while (rs.next()) {
                    provider = rs.getString("provider");
                    image = rs.getBytes("car_image");
                    type = rs.getString("type");
                    model = rs.getString("model");
                    brand = rs.getString("brand");
                    transition = rs.getString("transition");
                    capacity = rs.getString("capacity");
                    price = rs.getString("price");
                    
                }
                

            } catch (ClassNotFoundException | IllegalAccessException | SQLException | InstantiationException ex) {

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
