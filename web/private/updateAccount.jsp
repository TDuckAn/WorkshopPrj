<%-- 
    Document   : updateAccount
    Created on : 01-Mar-2025, 23:38:10
    Author     : Admin
--%>



<%@page import="Model.DTOAccount"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" %>

<%
    DTOAccount acc = (DTOAccount) request.getAttribute("account");
    if (acc == null) {
        response.sendRedirect("accountList.jsp");
        return;
    }
%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Update Account</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

    </head>
    <body>
        <%@include file="../header.jspf" %>
        <div class="container mt-5">
            <h2>Update Account</h2>
            <form action="${pageContext.request.contextPath}/updateAccount" method="post">
                <div class="mb-3">
                    <label class="form-label">Account</label>
                    <input type="text" class="form-control" name="account" value="<%= acc.getAccount()%>" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label">First Name</label>
                    <input type="text" class="form-control" name="firstName" value="<%= acc.getFirstName()%>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Last Name</label>
                    <input type="text" class="form-control" name="lastName" value="<%= acc.getLastName()%>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-control" name="pass" value="<%= acc.getPass()%>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Birthday</label>
                    <input type="date" class="form-control" name="birthday" value="<%= acc.getBirthday()%>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Gender</label>
                    <select class="form-select" name="gender">
                        <option value="true" <%= acc.isGender() ? "selected" : ""%>>Male</option>
                        <option value="false" <%= !acc.isGender() ? "selected" : ""%>>Female</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Phone</label>
                    <input type="text" class="form-control" name="phone" value="<%= acc.getPhone()%>" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <select class="form-select" name="role">
                        <option value="1" <%= acc.getRoleInSystem() == 1 ? "selected" : ""%>>Administrator</option>
                        <option value="2" <%= acc.getRoleInSystem() == 2 ? "selected" : ""%>>Staff</option>
                        <option value="3" <%= acc.getRoleInSystem() == 3 ? "selected" : ""%>>User</option> 
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">Active Status</label>
                    <select class="form-select" name="isUse">
                        <option value="true" <%= acc.isIsUse() ? "selected" : ""%>>Active</option>
                        <option value="false" <%= !acc.isIsUse() ? "selected" : ""%>>Inactive</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary">Save Changes</button>
                <a href="${pageContext.request.contextPath}/AccountServlet" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </body>
</html>

