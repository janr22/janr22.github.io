<%-- 
    Document   : home
    Created on : May 14, 2018, 1:27:10 PM
    Author     : msi
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <title>Welcome, <%= session.getAttribute("username")%></title>
        <style>

            html{
                height: 100%;
                margin-left: 15px;
            }

            body{
                height: 100%;
            }

            #container{
                height: 100%;
            }

            #row{
                height: 100%;
            }
        </style>
    </head>
    <body>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
            if (session.getAttribute("username") == null) {
                response.sendRedirect("index.jsp");
            }

        %>
        <div id="container">
            <div class="row" id="row">
                <div class="container col-md-2 bg-dark p-0">
                    <div><img class="rounded-circle p-auto m-auto w-auto h-auto" src="/images/profile.png" alt=""></div>
                    <div class="text-center text-light"><h1><%=session.getAttribute("username")%></h1></div>
                    <nav class="flex-column text-center">
                        <input class="btn-primary w-100" type="button" href="home.jsp" value="home">
                        <input class="btn-primary w-100" type="button" data-toggle="collapse" data-target="#category" aria-expanded="false" aria-controls="category" value="Service Provider">
                        <div class="collapse" id="category">
                            <div>
                                <form>
                                    <input class="btn-primary w-100" type="submit" name="provider" value="avis">
                                    <input class="btn-primary w-100" type="submit" name="provider" value="zen">
                                    <input class="btn-primary w-100" type="submit" name="provider" value="bcr">
                                </form>
                            </div>
                        </div>
                        <form action="logout">
                            <input class="btn-primary w-100" type="submit" value="logout">
                        </form>
                        
                    </nav>
                </div>
                <div class="container col-md-10 bg-light p-0">
                    <div class="row">
                    <div class="p-5 col-md-9"><h1>Cars</h1></div>
                    <form class="p-5 col-md-3">
                        <label>note: search one word at a time</label>
                        <input class="w-auto" type="text" placeholder="Search" name="search">
                        <button class="btn-outline-success w-auto" type="submit">Search</button>
                    </form>
                    </div>
                    <div class="row">
                        <%@include file="includes/search.jsp"%>
                        <%
                            String provider = request.getParameter("provider");
                            String type;
                            String model;
                            String brand;
                            String transition;
                            String capacity;
                            String price;
                            byte[] image;
                            try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental", "root", "");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("SELECT * FROM cars WHERE provider = '" + provider + "'");
                                while (rs.next()) {
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
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
