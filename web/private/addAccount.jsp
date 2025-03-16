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
     
    </head>
    <body class="bg-light">
        <%@include file="../header.jspf" %>

        <div class="container mt-5">
            <div class="card shadow-lg border-0 rounded-4 p-4">
                <h2 style="color: #9b59b6" class="text-center fw-bold">Add New Account</h2>
                <form action="${pageContext.request.contextPath}/AddAcc" method="post">
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Account</label>
                                <input type="text" class="form-control" name="account" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">First Name</label>
                                <input type="text" class="form-control" name="firstName" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Last Name</label>
                                <input type="text" class="form-control" name="lastName" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Password</label>
                                <input type="password" class="form-control" name="pass" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Birthday</label>
                                <input type="date" class="form-control" name="birthday" required>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Gender</label>
                                <select class="form-select" name="gender">
                                    <option value="true">Male</option>
                                    <option value="false">Female</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Phone</label>
                                <input type="text" class="form-control" name="phone" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Role</label>
                                <select class="form-select" name="role">
                                    <option value="1">Administrator</option>
                                    <option value="2">Staff</option>
                                    <option value="3">User</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Active Status</label>
                                <select class="form-select" name="isUse">
                                    <option value="true">Active</option>
                                    <option value="false">Inactive</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between">
                        <button type="submit" style="background: #9b59b6" class="btn btn-primary btn-lg px-4">
                            <i class="bi bi-plus-circle"></i> Add Account
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
