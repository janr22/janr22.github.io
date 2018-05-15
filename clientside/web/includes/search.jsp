<%-- 
    Document   : search
    Created on : May 14, 2018, 9:22:18 PM
    Author     : msi
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
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
        
        while(rs.next()) {
            provider = rs.getString("provider");
            image = rs.getBytes("car_image");
            type = rs.getString("type");
            model = rs.getString("model");
            brand = rs.getString("brand");
            transition = rs.getString("transition");
            capacity = rs.getString("capacity");
            price = rs.getString("price");

            out.println("<div class='m-5 col-xs'>");
            out.println(provider + "<br>");
            out.println("<img src='" + image + "'><br>");
            out.println("Type: " + type + "<br>");
            out.println("Model: " + model + "<br>");
            out.println("Brand: " + brand + "<br>");
            out.println("Transition: " + transition + "<br>");
            out.println("Capacity: " + capacity + "<br>");
            out.println("Price: " + price + "<br>");
            out.println("<form action='rent'>");
            out.println("<input class='btn-primary w-100' type='submit' value='rent'>");
            out.println("</form>");
            out.println("</div>");
        }
        
            
    } catch (ClassNotFoundException | IllegalAccessException | SQLException | InstantiationException ex) {

    }
%>