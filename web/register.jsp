<%-- 
    Document   : register
    Created on : 16-Mar-2025, 00:27:24
    Author     : Admin
--%>


<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Register</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    </head>
    <body>
        <div class="auth-container">
            <div class="auth-box">
                <h3 class="mb-4 text-center">Register</h3>

                <c:if test="${not empty errorMsg}">
                    <div class="alert alert-danger">${errorMsg}</div>
                </c:if>
                <c:if test="${not empty successMsg}">
                    <div class="alert alert-success">${successMsg}</div>
                </c:if>

                <form action="RegisterServlet" method="post">
                    <div class="mb-3">
                        <label for="account" class="form-label">Username</label>
                        <input type="text" class="form-control" id="account" name="account" required>
                    </div>
                    <div class="mb-3">
                        <label for="pass" class="form-label">Password</label>
                        <input type="password" class="form-control" id="pass" name="pass" required>
                    </div>
                    <div class="mb-3">
                        <label for="confirmPass" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmPass" name="confirmPass" required>
                    </div>
                    <div class="mb-3">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" required>
                    </div>
                    <div class="mb-3">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lastName" name="lastName" required>
                    </div>
                    <div class="mb-3">
                        <label for="birthday" class="form-label">Birthday</label>
                        <input type="date" class="form-control" id="birthday" name="birthday" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Gender</label>
                        <div>
                            <input type="radio" id="male" name="gender" value="true" required>
                            <label for="male">Male</label>
                            <input type="radio" id="female" name="gender" value="false" required>
                            <label for="female">Female</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="text" class="form-control" id="phone" name="phone" required>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Register</button>
                </form>

                <div class="mt-3 text-center">
                    <small>Already have an account? <a href="login.jsp">Login here</a></small>
                </div>

                <!-- Continue as Guest Button -->
                <div class="mt-3 text-center">
                    <a href="index.jsp" class="btn btn-outline-secondary w-100">Continue as Guest</a>
                </div>
            </div>
        </div>
    </body>
</html>
