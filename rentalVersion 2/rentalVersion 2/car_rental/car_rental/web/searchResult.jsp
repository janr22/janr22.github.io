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
        <title>search</title>
    </head>
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
       
            
            <table>
                    <thead>
                    <th>Car Type</th>
                    <th>Brand of Car</th>
                    <th>Price</th>
                    <th>Status</th>
                    <th>Plate Number</th>
                    <th>Action</th>
                    </thead>

             <%
                       String search = request.getParameter("searchCar");
                       try {
                           Class.forName("com.mysql.jdbc.Driver").newInstance();
                              Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/rental", "root" , "");
                              String query = "select * from cars where car_type=? or car_brand=? or value=? or status=? or plate_num=?";
                              PreparedStatement pst = (PreparedStatement) conn.prepareStatement(query);

                              pst.setString(1, search);
                              pst.setString(2, search);
                              pst.setString(3, search);
                              pst.setString(4, search);
                              pst.setString(5, search);


                              ResultSet rs = pst.executeQuery();
                              if(rs.first()){
                                  do {
                                      %> 
                                      
                                      <tr>
                                          <td><%= rs.getString("car_type")%></td>
                                          <td><%= rs.getString("car_brand")%></td>
                                          <td><%= rs.getString("value")%></td>
                                          <td><%= rs.getString("status")%></td>
                                          <td><%= rs.getString("plate_num")%></td>
                                          <td>
                                              <form method="POST" action="rentServlet">
                                                 
                                              
                                              <input type="hidden" name="id" value="<%= rs.getString("car_id")%>" />
                                   <% if (rs.getString("status").equalsIgnoreCase("Available")){
                                        %>
                                        <input type="submit" name="changeStatus" value="Rent"/>
                                        
                                   <% } else {
                                   %>
                                        <input type="submit" name="changeStatus" value="Cancel">
                                    <%
                                        }
                                    %>
                                </form>
                                          </td>
                                      </tr>        
                    

                           <%     } while (rs.next());
                              }  else {
                                        
                              }                     
                       } catch (Exception e) {

                       }
                   %>
                   </table>
                   <br>
             <button type="submit"><a href="home.jsp">Back</a></button>
    </body>
</html>
