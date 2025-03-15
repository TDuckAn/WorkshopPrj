<%-- 
    Document   : login
    Created on : 28-Feb-2025, 08:56:34
    Author     : Admin
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

        
    </head>
    <body>
        <div class="login-box">
            <img src="${pageContext.request.contextPath}/img_avatar1.png" alt="Login Logo">
            <h3 class="mb-4">Login</h3>
            <form action="LoginServlet" method="post">
                <div class="mb-3">
                    <label for="account" class="form-label">Account</label>
                    <input type="text" class="form-control" id="account" name="account" required>
                </div>
                <div class="mb-3">
                    <label for="pass" class="form-label">Password</label>
                    <input type="password" class="form-control" id="pass" name="pass" required>
                </div>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">
                        ${errorMessage}
                    </div>
                </c:if>
                <button type="submit" class="btn btn-primary w-100">Login</button>
            </form>

            
            <p class="mt-3">Don't have an account?</p>
            <a href="register.jsp" class="btn btn-secondary w-100">Register</a>
            <form action="productDisplay">
                <button type="submit" style="background-color: #ccc; border: none; padding: 10px 20px; margin-top: 10px; cursor: pointer;">
                    Continue as Guest
                </button>
            </form>
        </div>
    </body>
</html>

