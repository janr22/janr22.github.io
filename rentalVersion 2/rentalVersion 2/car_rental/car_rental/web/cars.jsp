<%-- 
    Document   : home
    Created on : Apr 27, 2018, 8:57:18 PM
    Author     : KUPS
--%>

<%@ page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });

        </script>
    
    <body>
        
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="cars.jsp">Car Rentals</a></li>
            <li><a href="profile.jsp">Profile</a></li>
            <li>Welcome <%=session.getAttribute("firstname")%> <%=session.getAttribute("lastname")%></li>
            <form method="POST" action="logoutServlet">
            <li><a href="login.jsp">Logout</a></li>
            </form>
        </ul>
            
            <form method="POST" action="searchResult.jsp">
                <h3>Car Details</h3>
                    <input  type="text" name="searchCar" placeholder="search" />    
                    <input  type="submit" value="Search" />
            </form>

                    <table>
                        <thead>
                            <th>Car Type</th>
                            <th>Brand of Car</th>
                            <th># of days to be rented </th>
                            <th>Price</th>
                            <th>Plate Number</th>
                            <th>Status</th>
                            <th>Total Amount</th>
                            <th>Action</th>
                            
                        </thead>
                  <% 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/rental", "root" , "");
                        String query = "Select * from cars";
                        PreparedStatement pst = (PreparedStatement) conn.prepareStatement(query);
                        ResultSet rs = pst.executeQuery();

                        if(rs.first()){
                                 do {
                  %>
                        <tr>
                            <form method="POST" action="rentServlet">
                                <input type="hidden" value="<%=rs.getString("car_id")%>" name="carid"/>
                            <td><%= rs.getString("car_type")%></td>
                            <td><%= rs.getString("car_brand")%></td>

                            <td>
                                    <input type="text" name="day" size="5"/>
                            </td>
                            <td><%= rs.getString("value")%></td>
                            <td><%= rs.getString("plate_num")%></td>
                            <td><%= rs.getString("status")%></td>
                           
                            <td><%= rs.getString("total")%></td>

                                <input type="hidden" name="id" value="<%= rs.getString("car_id")%>" />
                                <input type="hidden" name="userid" value="<%= session.getAttribute("userid")%>" />
                                <% if (rs.getString("status").equalsIgnoreCase("Available")){
                                        %>
                            <td><input type="submit" name="changeStatus" value="Rent"/></td>
                                        
                                   <% } else {
                                   %>
                                        <td> <input type="submit" name="changeStatus" value="Cancel"></td>
                                    <%
                                        }
                                    %>
                                </form>

                                        
                            </tr>
                            <%}while(rs.next());

                    }%>
                    </table>

    </body>
</html>
