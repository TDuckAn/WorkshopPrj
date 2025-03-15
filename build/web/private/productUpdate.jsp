<%@page import="Model.DAOProduct"%>
<%@page import="Model.DTOProduct"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
    String productId = request.getParameter("productId");
    DAOProduct dao = new DAOProduct();
    DTOProduct product = null;

    if (productId != null && !productId.trim().isEmpty()) {
        product = dao.getObjeCtById(productId);
    }

    if (product == null) {
        response.sendRedirect("productList.jsp?error=ProductNotFound");
        return;
    }

    request.setAttribute("product", product);
%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

    </head>
    <body>
        <%@include file="../header.jspf" %>

        <div class="container mt-5">
            <h2 class="text-center">Update Product</h2>

            <form action="${pageContext.request.contextPath}/updateProduct" method="post">
                <div class="mb-3">
                    <label class="form-label">Product ID:</label>
                    <input type="text" class="form-control" name="productId" value="${product.productId}" readonly>
                </div>

                <div class="mb-3">
                    <label class="form-label">Product Name:</label>
                    <input type="text" class="form-control" name="productName" value="${product.productName}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Product Image URL:</label>
                    <input type="text" class="form-control" name="productImage" value="${product.productImage}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Brief Description:</label>
                    <textarea class="form-control" name="brief" rows="3" required>${product.brief}</textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Posted Date:</label>
                    <input type="date" class="form-control" name="postedDate" value="${product.postedDate}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Category:</label>
                    <input type="number" class="form-control" name="typeId" value="${product.typeId.typeId}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Account ID:</label>
                    <input type="text" class="form-control" name="accountId" value="${product.account.account}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Unit:</label>
                    <input type="text" class="form-control" name="unit" value="${product.unit}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Price:</label>
                    <input type="number" class="form-control" name="price" value="${product.price}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Discount (%):</label>
                    <input type="number" class="form-control" name="discount" value="${product.discount}" required>
                </div>

                <button type="submit" class="btn btn-primary">Update Product</button>
                <a href="${pageContext.request.contextPath}/ProductServlet" class="btn btn-secondary">Cancel</a>
            </form>
        </div>
    </body>
</html>