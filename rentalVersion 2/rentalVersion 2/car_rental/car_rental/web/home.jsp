<%-- 
    Document   : home
    Created on : Apr 27, 2018, 8:57:18 PM
    Author     : KUPS
--%>
<%@page import="java.io.IOException"%>
<%@ page import ="java.sql.*" %>
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
       
            <form method="POST" action="searchResult.jsp">
                <h3>Car Details</h3>
                    <input  type="text" name="searchCar" placeholder="search" />    
                    <input  type="submit" value="Search" />
            </form>

    </body>
</html>
