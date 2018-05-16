<%-- 
    Document   : profile
    Created on : Apr 29, 2018, 10:06:11 PM
    Author     : KUPS
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        
        <h1>PROFILE</h1>
        
        <form method="POST" action="searchResult.jsp">
                <h3>Search for the car you wanted</h3>
                    <input  type="text" name="searchCar" placeholder="search" />    
                    <input  type="submit" value="Search" />
            </form>

                
             <% 
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/rental", "root" , "");
                        String query = "Select * from user left join rent on rent.id_no = user.id_no limit 1";
                        PreparedStatement pst = (PreparedStatement) conn.prepareStatement(query);
                        ResultSet rs = pst.executeQuery();

                        if(rs.first()){
                                 do {
                        %>

                       <ul>
                           <input type="hidden" value="<%= rs.getString("id_no")%>" name="userId">
                            <li><%= session.getAttribute("firstname")%>, <%= session.getAttribute("lastname")%></li>
                            <li><%= session.getAttribute("contact_number")%></li>
                            <li><%= session.getAttribute("address")%></li>

                            </ul>
                        <%}while(rs.next());
               
                }%>
    </table>
    </body>
</html>
