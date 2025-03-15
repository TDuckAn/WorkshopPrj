<%-- 
    Document   : categoryList
    Created on : 02-Mar-2025, 03:04:32
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
        <title>Category List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

    </head>
    <body>
        <%@include file="../header.jspf" %>

        <div class="container mt-5">
            <h2 class="text-center">Category List</h2>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Type ID</th>
                        <th>Category Name</th>
                        <th>Memo</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="category" items="${categoryList}">
                        <tr>
                            <td>${category.typeId}</td>
                            <td>${category.categoryName}</td>
                            <td>${category.memo}</td>
                            <td>
                                <a href="updateCategory?typeId=${category.typeId}" class="btn btn-primary">Update</a>
                                <a href="deleteCategory?typeId=${category.typeId}" 
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this category?');">
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

