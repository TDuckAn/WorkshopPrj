<%-- 
    Document   : accountList
    Created on : 01-Mar-2025, 23:01:32
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Account List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

    </head>
    <body>
        <%@include file="../header.jspf" %>

        <div class="container mt-5">
            <h2 class="text-center">Account List</h2>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
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
                            <td>${account.gender ? "Male" : "Female"}</td>
                            <td>${account.phone}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${account.roleInSystem == 1}">Admin</c:when>
                                    <c:when test="${account.roleInSystem == 2}">Staff</c:when>
                                    <c:when test="${account.roleInSystem == 3}">User</c:when> 
                                    <c:otherwise>Unknown</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="updateAccount?account=${account.account}" class="btn btn-primary">Update</a>
                                </a>
                                <a href="ChangeStatusServlet?account=${account.account}&isUse=${account.isUse ? 'false' : 'true'}"
                                   class="btn ${account.isUse ? 'btn-warning' : 'btn-success'} btn-sm">
                                    <i class="bi ${account.isUse ? 'bi-toggle-off' : 'bi-toggle-on'}"></i>
                                    ${account.isUse ? 'Deactivate' : 'Activate'}
                                </a>
                                <a href="deleteAccount?account=${account.account}" 
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this account?');">
                                    <i class="bi bi-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="index.jsp" class="btn btn-primary">Back to Home</a>
        </div>
    </body>
</html>
