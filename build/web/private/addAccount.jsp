<%-- 
    Document   : addAccount
    Created on : 02-Mar-2025, 02:48:06
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add Account</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

    </head>
    <body>
        <%@include file="../header.jspf" %>
        <div class="container mt-5">
            <h2 class="text-center">Add New Account</h2>
            <form action="${pageContext.request.contextPath}/AddAcc" method="post">
                <div class="mb-3">
                    <label class="form-label">Account:</label>
                    <input type="text" class="form-control" name="account" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password:</label>
                    <input type="password" class="form-control" name="pass" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Last Name:</label>
                    <input type="text" class="form-control" name="lastName" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">First Name:</label>
                    <input type="text" class="form-control" name="firstName" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Birthday:</label>
                    <input type="date" class="form-control" name="birthday" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Gender:</label>
                    <select class="form-control" name="gender">
                        <option value="true">Male</option>
                        <option value="false">Female</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Phone:</label>
                    <input type="text" class="form-control" name="phone" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Active:</label>
                    <select class="form-control" name="isUse">
                        <option value="true">Yes</option>
                        <option value="false">No</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Role:</label>
                    <select class="form-control" name="role">
                        <option value="1">Admin</option>
                        <option value="2">Staff</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Add Account</button>
                <a href="${pageContext.request.contextPath}/AccountServlet" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </body>
</html>