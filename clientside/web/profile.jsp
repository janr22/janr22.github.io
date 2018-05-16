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
                        <a href="home.jsp"><input class="btn-primary w-100" type="button" value="home"></a>
                        <form>
                            <input class="btn-primary w-100" type="submit" value="rented">
                        </form>
                        <form action="logout">
                            <input class="btn-primary w-100" type="submit" value="logout">
                        </form>

                    </nav>
                </div>
                <div class="container col-md-10 bg-light p-0">
                    <div class="row">
                        <div class="p-5 col-md-9"><h1>Profile</h1></div>
                        <form class="p-5 col-md-3">
                            <label>note: search one word at a time</label>
                            <input class="w-auto" type="text" placeholder="Search" name="search">
                            <button class="btn-outline-success w-auto" type="submit">Search</button>
                        </form>
                    </div>
                    <div class="row">   
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental", "root", "");
                            String query = "Select * from users left join rent on rent.user_id = users.user_id limit 1";
                            PreparedStatement pst = (PreparedStatement) conn.prepareStatement(query);
                            ResultSet rs = pst.executeQuery();

                            if (rs.first()) {
                                do {
                        %>

                        <ul>
                            <input type="hidden" value="<%= rs.getString("user_id")%>" name="userId">
                            <li><%= session.getAttribute("firstname")%>, <%= session.getAttribute("lastname")%></li>
                            <li><%= session.getAttribute("email")%></li>
                            <li><%= session.getAttribute("contact")%></li>
                            <li><%= session.getAttribute("address")%></li>
                        </ul>
                        <%} while (rs.next());

                            }%>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
