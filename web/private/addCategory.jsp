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
        <title>Add Category</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    </head>
    <body class="bg-light">
        <%@include file="../header.jspf" %>

        <div class="container mt-5">
            <div class="card shadow-lg border-0 rounded-4 p-4">
                <h2 style="color: #9b59b6" class="text-center fw-bold">Add Category</h2>

                <form action="AddCategory" method="post">
                    <input type="hidden" name="typeId" value="${category.typeId}">

                    <div class="mb-3">
                        <label class="form-label fw-bold">Category Name:</label>
                        <input type="text" class="form-control" name="categoryName" value="${category.categoryName}" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Memo:</label>
                        <textarea class="form-control" name="memo" rows="3">${category.memo}</textarea>
                    </div>

                    <div class="d-flex justify-content-between">
                        <button type="submit" style="background: #9b59b6" class="btn btn-primary btn-lg px-4">
                            <i class="bi bi-save"></i> Save
                        </button>
                        <a href="CategoryServlet" class="btn btn-secondary btn-lg px-4">
                            <i class="bi bi-x-circle"></i> Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
