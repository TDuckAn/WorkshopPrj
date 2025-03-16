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
        <div class="auth-container">
            <div class="auth-box">
                <img src="${pageContext.request.contextPath}/images/img_avatar1.png" class="auth-image" alt="Login Icon">
                <h3 class="mb-4 text-center">Login</h3>

                <c:if test="${not empty errorMsg}">
                    <div class="alert alert-danger">${errorMsg}</div>
                </c:if>

                <form action="LoginServlet" method="post">
                    <div class="mb-3">
                        <label for="account" class="form-label">Username</label>
                        <input type="text" class="form-control" id="account" name="account" required>
                    </div>
                    <div class="mb-3">
                        <label for="pass" class="form-label">Password</label>
                        <input type="password" class="form-control" id="pass" name="pass" required>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Login</button>
                </form>

                <div class="mt-3 text-center">
                    <small>Don't have an account? <a href="register.jsp">Register here</a></small>
                </div>

                <!-- Continue as Guest Button -->
                <div class="mt-3 text-center">
                    <a href="index.jsp" class="btn btn-outline-secondary w-100">Continue as Guest</a>
                </div>
            </div>
        </div>
    </body>
</html>
