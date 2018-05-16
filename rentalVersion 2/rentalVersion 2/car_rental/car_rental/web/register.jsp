<%-- 
    Document   : register
    Created on : Apr 28, 2018, 8:53:51 PM
    Author     : KUPS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>

    </head>
    <body>
        <h1>Register</h1>
        <form action="registerServlet" method="post">
            Username: <input type="text" name="username" autocomplete="off" required/><br>
            Password: <input type="password" name="password" autocomplete="off" required/><br>
            First name: <input type="text" name="firstname" autocomplete="off" required/><br>
            Last Name: <input type="text" name="lastname" autocomplete="off" required/><br>
            Contact Number: <input type="text" name="contact_number" autocomplete="off" required/><br>
            Address: <input type="text" name="address" autocomplete="off" required/><br>
            <input type="Submit" value="Submit">
            <input type="reset" value="reset"><br>
            <button value="test" /><a href="login.jsp">Cancel</a></button>
        </form>

        
 
    </body>
</html>
