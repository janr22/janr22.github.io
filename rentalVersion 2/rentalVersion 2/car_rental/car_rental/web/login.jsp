<%-- 
    Document   : login
    Created on : Apr 27, 2018, 5:51:27 PM
    Author     : KUPS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>LOGIN</h1>
        <form action="loginServlet" method="POST">
            Username: <input type="text" name="username" placeholder="Enter Username" size="30" /><br>
            Password: <input type="password" name="password" placeholder="Enter Password" size="30" /></br>
            <input type="submit" value="Submit"/><br>
            <a href="register.jsp">Click here to register.</a>
        </form>
    </body>
</html>
