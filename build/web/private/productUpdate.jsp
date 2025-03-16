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

    </head>
    <body>
        <%@include file="../header.jspf" %>

        <div class="container mt-5">
            <div class="card shadow-lg p-4">
                <h2 style="color: #9b59b6" class="text-center  mb-4">Update Product</h2>
                <form action="${pageContext.request.contextPath}/updateProduct" method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Product ID:</label>
                                <input type="text" class="form-control" name="productId" value="${product.productId}" readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Product Name:</label>
                                <input type="text" class="form-control" name="productName" value="${product.productName}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Product Image URL:</label>
                                <input type="text" class="form-control" name="productImage" value="${product.productImage}" id="imageInput" required>
                                
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Brief Description:</label>
                                <textarea class="form-control" name="brief" rows="3" required>${product.brief}</textarea>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Posted Date:</label>
                                <input type="date" class="form-control" name="postedDate" value="${product.postedDate}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Category:</label>
                                <input type="number" class="form-control" name="typeId" value="${product.typeId.typeId}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Account ID:</label>
                                <input type="text" class="form-control" name="accountId" value="${product.account.account}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Unit:</label>
                                <input type="text" class="form-control" name="unit" value="${product.unit}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Price:</label>
                                <input type="number" class="form-control" name="price" value="${product.price}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Discount (%):</label>
                                <input type="number" class="form-control" name="discount" value="${product.discount}" required>
                            </div>
                        </div>
                    </div>

                    <div class="text-center">
                        <button style="background: #9b59b6" type="submit" class="btn btn-success me-2">
                            <i class="bi bi-pencil"></i> Update Product
                        </button>
                        <a href="${pageContext.request.contextPath}/ProductServlet" class="btn btn-secondary">
                            <i class="bi bi-arrow-left"></i> Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>

        
    </body>
</html>
