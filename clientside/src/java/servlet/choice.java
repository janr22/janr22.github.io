/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author msi
 */
public class choice extends HttpServlet {

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
            String provider = request.getParameter("provider");
            String image = request.getParameter("image");
            String carID = request.getParameter("car_id");
            String type = request.getParameter("type");
            String model = request.getParameter("model");
            String brand = request.getParameter("brand");
            String transition = request.getParameter("transition");
            String capacity = request.getParameter("type");
            String price = request.getParameter("type");
            
            out.println("<div class='m-5 col-xs'>");
            out.println("Provider: " + provider + "<br>");
            out.println("<img src='" + image + "'><br>");
            out.println("<input type='hidden' value='" + carID + "'>");
            out.println("Type: " + type + "<br>");
            out.println("Model: " + model + "<br>");
            out.println("Brand: " + brand + "<br>");
            out.println("Transition: " + transition + "<br>");
            out.println("Capacity: " + capacity + "<br>");
            out.println("Price: <input value = '" + price + "' id='price' disabled><br>");
            out.println("Number of days:");
            out.println("<input id='days' type='number' min='0' max='99'><br>");
            out.println("Total Price: <input id='tprice' disabled><br>");
            out.println("<button class='btn-primary w-100' type='submit' onclick='compute()'>rent</button>");
            out.println("</div>");
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
