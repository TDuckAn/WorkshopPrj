<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Category List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body class="bg-light">
        <%@include file="../header.jspf" %>

        <div class="container mt-5">
            <div class="card shadow-lg border-0 rounded-4 p-4">
                <h2 style="color: #9b59b6" class="text-center fw-bold">Category List</h2>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle text-center">
                        <thead style="background: #9b59b6; color: white;">
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
                                        <a style="background: #9b59b6; color: white" href="updateCategory?typeId=${category.typeId}" class="btn  btn-sm">
                                            <i class="bi bi-pencil-square"></i> Update
                                        </a>
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
                </div>

                <div class="d-flex justify-content-between mt-3">
                    <a style="background: #9b59b6" href="index.jsp" class="btn btn-secondary btn-lg">
                        <i class="bi bi-house-door"></i> Back to Home
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
