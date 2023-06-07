<%-- 
    Document   : login
    Created on : Jun 5, 2023, 9:33:59 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <body>
        <div class="form">
            <div class="form-panel one">
                <div class="form-header">
                    <h1>Account Login</h1>
                </div>
                <div class="form-content">
                    <form action="home" method="post">
                        <div class="form-group">
                            <label for="username">Username</label>
                            <input type="text" id="username" name="username" required="required" value="${useName}"/>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" required="required" value="${password}"/>
                        </div>
                        <div class="form-group">
                            <button type="submit">Log In</button>
                        </div>
                        <div class="message" style="display: flex ;color: red; justify-content:center;"><span>${message}</span></div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
