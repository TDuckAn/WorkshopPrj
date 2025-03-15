<%-- 
    Document   : Addproduct
    Created on : 03-Mar-2025, 01:52:14
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
        <title>Add Product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">


    </head>
    <body>
        <%@include file="../header.jspf" %>
        <div class="container mt-5">
            <h2 class="text-center">Add New Product</h2>
            <form action="${pageContext.request.contextPath}/AddProduct" method="post">
                <div class="mb-3">
                    <label class="form-label">Product ID:</label>
                    <input type="text" class="form-control" name="productId" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Product Name:</label>
                    <input type="text" class="form-control" name="productName" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Product Image URL:</label>
                    <input type="text" class="form-control" name="productImage">
                </div>
                <div class="mb-3">
                    <label class="form-label">Brief Description:</label>
                    <textarea class="form-control" name="brief" rows="3" required></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Posted Date:</label>
                    <input type="date" class="form-control" name="postedDate" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Category:</label>
                    <input type="number" class="form-control" name="typeId" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Account ID:</label>
                    <input type="text" class="form-control" name="accountId" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Unit:</label>
                    <input type="text" class="form-control" name="unit" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Price:</label>
                    <input type="number" class="form-control" name="price" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Discount (%):</label>
                    <input type="number" class="form-control" name="discount" value="0">
                </div>
                <button type="submit" class="btn btn-primary">Add Product</button>
                <a href="${pageContext.request.contextPath}/ProductServlet" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </body>
</html>