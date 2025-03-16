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

<!DOCTYPE html>
<html>
    <head>
        <title>Update Account</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body class="bg-light">
        <%@include file="../header.jspf" %>

        <div class="container mt-5">
            <div class="card shadow-lg border-0 rounded-4 p-4">
                <h2 style="color: #9b59b6" class="text-center fw-bold">Update Account</h2>
                <form action="${pageContext.request.contextPath}/updateAccount" method="post">
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Account</label>
                                <input type="text" class="form-control bg-light" name="account" value="<%= acc.getAccount()%>" readonly>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">First Name</label>
                                <input type="text" class="form-control" name="firstName" value="<%= acc.getFirstName()%>" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Last Name</label>
                                <input type="text" class="form-control" name="lastName" value="<%= acc.getLastName()%>" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Password</label>
                                <input type="password" class="form-control" name="pass" value="<%= acc.getPass()%>" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Birthday</label>
                                <input type="date" class="form-control" name="birthday" value="<%= acc.getBirthday()%>" required>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Gender</label>
                                <select class="form-select" name="gender">
                                    <option value="true" <%= acc.isGender() ? "selected" : ""%>>Male</option>
                                    <option value="false" <%= !acc.isGender() ? "selected" : ""%>>Female</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Phone</label>
                                <input type="text" class="form-control" name="phone" value="<%= acc.getPhone()%>" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Role</label>
                                <select class="form-select" name="role">
                                    <option value="1" <%= acc.getRoleInSystem() == 1 ? "selected" : ""%>>Administrator</option>
                                    <option value="2" <%= acc.getRoleInSystem() == 2 ? "selected" : ""%>>Staff</option>
                                    <option value="3" <%= acc.getRoleInSystem() == 3 ? "selected" : ""%>>User</option> 
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Active Status</label>
                                <select class="form-select" name="isUse">
                                    <option value="true" <%= acc.isIsUse() ? "selected" : ""%>>Active</option>
                                    <option value="false" <%= !acc.isIsUse() ? "selected" : ""%>>Inactive</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between">
                        <button  type="submit" style="background: #9b59b6" class="btn btn-primary btn-lg px-4">
                            <i class="bi bi-save"></i> Save Changes
                        </button>
                        <a style="background: #9b59b6" href="${pageContext.request.contextPath}/AccountServlet" class="btn btn-secondary btn-lg px-4">
                            <i class="bi bi-x-circle"></i> Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
