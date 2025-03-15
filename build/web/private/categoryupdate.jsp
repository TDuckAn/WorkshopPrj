<%-- 
    Document   : categoryupdate
    Created on : 02-Mar-2025, 03:18:04
    Author     : Admin
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, Model.DAOCategory, Model.DTOCategory" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<%
    String typeId = request.getParameter("typeId");
    DAOCategory dao = new DAOCategory();
    DTOCategory category = null;

    if (typeId != null && !typeId.trim().isEmpty()) {
        category = dao.getObjeCtById(typeId);
    }

    if (category == null) {
        response.sendRedirect("categoryList.jsp?error=CategoryNotFound");
        return;
    }

    request.setAttribute("category", category);
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Update Category</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

    </head>
    <body>
        <%@include file="../header.jspf" %>

        <div class="container mt-5">
            <h2 class="text-center">Update Category</h2>

            <form action="updateCategory" method="post">

                <input type="hidden" name="typeId" value="${category.typeId}">

                <div class="mb-3">
                    <label class="form-label">Category Name:</label>
                    <input type="text" class="form-control" name="categoryName" 
                           value="${category.categoryName}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Memo:</label>
                    <textarea class="form-control" name="memo" rows="3" >${category.memo}</textarea>
                </div>

                <button type="submit" class="btn btn-primary">Save</button>
                <a href="categoryList.jsp" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </body>
</html>
