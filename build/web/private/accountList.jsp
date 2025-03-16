<%-- 
    Document   : accountList
    Created on : 01-Mar-2025, 23:01:32
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Account List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

        <style>
            .custom-purple { background-color: #9b59b6 !important; border-color: #9b59b6 !important; }
            .custom-purple:hover { background-color: #8e44ad !important; }
            .text-purple { color: #9b59b6 !important; }
        </style>
    </head>
    <body class="bg-light">
        <%@include file="../header.jspf" %>

        <div class="container mt-5">
            <div class="card shadow-lg border-0 rounded-4 p-4">
                <h2 class="text-center text-purple fw-bold">Account List</h2>

                <div class="table-responsive">
                    <table class="table table-hover table-striped align-middle text-center">
                        <thead class="custom-purple text-white">
                            <tr>
                                <th>Account</th>
                                <th>Last Name</th>
                                <th>First Name</th>
                                <th>Birthday</th>
                                <th>Gender</th>
                                <th>Phone</th>
                                <th>Role</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="account" items="${accountList}">
                                <tr>
                                    <td>${account.account}</td>
                                    <td>${account.lastName}</td>
                                    <td>${account.firstName}</td>
                                    <td>${account.birthday}</td>
                                    <td>
                                        <span class="badge ${account.gender ? 'bg-info' : 'bg-warning'}">
                                            ${account.gender ? "Male" : "Female"}
                                        </span>
                                    </td>
                                    <td>${account.phone}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${account.roleInSystem == 1}">
                                                <span class="badge bg-danger">Admin</span>
                                            </c:when>
                                            <c:when test="${account.roleInSystem == 2}">
                                                <span class="badge bg-primary">Staff</span>
                                            </c:when>
                                            <c:when test="${account.roleInSystem == 3}">
                                                <span class="badge bg-success">User</span>
                                            </c:when> 
                                            <c:otherwise>
                                                <span class="badge bg-secondary">Unknown</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="updateAccount?account=${account.account}" 
                                           class="btn btn-sm custom-purple text-white">
                                            <i class="bi bi-pencil-square"></i> Update
                                        </a>

                                        <a href="ChangeStatusServlet?account=${account.account}&isUse=${account.isUse ? 'false' : 'true'}"
                                           class="btn btn-sm ${account.isUse ? 'btn-warning' : 'btn-success'}">
                                            <i class="bi ${account.isUse ? 'bi-toggle-off' : 'bi-toggle-on'}"></i>
                                            ${account.isUse ? 'Deactivate' : 'Activate'}
                                        </a>

                                        <a href="deleteAccount?account=${account.account}" 
                                           class="btn btn-sm btn-danger"
                                           onclick="return confirm('Are you sure you want to delete this account?');">
                                            <i class="bi bi-trash"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="d-flex justify-content-between mt-3">
                    <a href="index.jsp" class="btn custom-purple text-white">
                        <i class="bi bi-arrow-left"></i> Back to Home
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
