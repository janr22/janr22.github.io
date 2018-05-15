<%-- 
    Document   : index
    Created on : May 14, 2018, 10:01:20 AM
    Author     : msi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <title>Car Rentals</title>
        <style>
            *{
                
                background-color:black;
                color: white;

            }

            h1{
                color:hsla(213, 77%, 40%, 1);
            }     

            a:hover{
                text-decoration: none;
            }

            #rowtwo{
                clear: both;
            }
            
            span{
                font-weight: 100;
            }
            
            #title{
                font-size: 80px;
                
            }
            
            #title b{
                color: hsla(213, 77%, 40%, 1);
                font-size:112px;
            }
            
            @media only screen and (max-width: 600px) {
                #rowone{
                    margin:0;
                    width: 100%;
                }

                #rrowtwo{
                    margin:0;
                    width:100%;
                }
            }
        </style>
    </head>
    <body>
        <main>
            <div class="text-center p-5" id="title"><b>BaguioCar</b> <span>rentals</span></div>
            <div class="row m-5 p-5" id="login">
                <div class="col-md-3">
                    <div id="myForm">
                        <div id="header"><h1>Login</h1></div>
                        <form method="post" action="login">
                            <div class="form-group">
                                <label>Username:</label>
                                <input type="text" class="form-control" name="username" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <label>Password:</label>
                                <input type="password" class="form-control" name="password" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-primary" name="submit" value="Login">
                            </div>
                            <div class="form-group">
                                <label>Don't have an account? <a href="#register" >Sign up</a></label>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-9">
                    <img class="" src="images/bg.jpg">
                </div>
            </div>
            
            <div class="row m-5 p-5 float-md-right" id="register">
                <div class="col-md-9">
                    <img class="d-block w-100" src="images/bg1.jpg">
                </div>
                <div id="registerform" class="col-md-3"> 
                    <form id="register-form" method="post" action="register">
                        <div><h1>Register</h1></div>
                        <div class="form-group">
                            <label>Email:</label>
                            <input type="email" class="form-control" name="email" placeholder="Example@hotmail.com">
                        </div>
                        <div class="form-group">
                            <label>Username:</label>
                            <input type="text" class="form-control" name="username" placeholder="Example">
                        </div>
                        <div class="form-group">
                            <label>Password:</label>
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
                        </div>
                        <div class="form-group">
                            <label>Confirm Password:</label>
                            <input type="password" class="form-control" name="repassword" placeholder="Confirm Password" required>
                        </div>
                        <div class="form-group">
                            <label>Contact Number:</label>
                            <input type="text" class="form-control" name="number" placeholder="Contact Number">
                            <div id="unmatched"></div>
                        </div>
                        <div class="form-group">
                            <label>Address:</label>
                            <input type="text" class="form-control" name="address" placeholder="Address">
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary" name="submit" value="Register">
                        </div>
                    </form>
                </div>
                
            </div>
        </main>
    </body>
</html>
