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
   
    </head>
    <body>
        <%@include file="../header.jspf" %>

        <div class="container mt-5">
            <div class="card shadow-lg p-4">
                <h2 style="color: #9b59b6" class="text-center mb-4">Add New Product</h2>
                <form action="${pageContext.request.contextPath}/AddProduct" method="post">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Product ID:</label>
                                <input type="text" class="form-control" name="productId" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Product Name:</label>
                                <input type="text" class="form-control" name="productName" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Product Image URL:</label>
                                <input type="text" class="form-control" name="productImage" id="imageInput">
                                <div class="mt-2 text-center">
                                    <img id="imagePreview" src="" alt="Image Preview" class="rounded shadow" style="max-width: 150px; display: none;">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Brief Description:</label>
                                <textarea class="form-control" name="brief" rows="3" required></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Posted Date:</label>
                                <input type="date" class="form-control" name="postedDate" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Category:</label>
                                <input type="number" class="form-control" name="typeId" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Account ID:</label>
                                <input type="text" class="form-control" name="accountId" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Unit:</label>
                                <input type="text" class="form-control" name="unit" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Price:</label>
                                <input type="number" class="form-control" name="price" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Discount (%):</label>
                                <input type="number" class="form-control" name="discount" value="0">
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <button style="background: #9b59b6" type="submit" class="btn btn-success me-2">
                            <i class="bi bi-plus-circle"></i> Add Product
                        </button>
                        <a href="${pageContext.request.contextPath}/ProductServlet" class="btn btn-secondary">
                            <i class="bi bi-x-circle"></i> Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <script>
            document.getElementById('imageInput').addEventListener('input', function() {
                let imageUrl = this.value;
                let imgPreview = document.getElementById('imagePreview');
                if (imageUrl) {
                    imgPreview.src = imageUrl;
                    imgPreview.style.display = 'block';
                } else {
                    imgPreview.style.display = 'none';
                }
            });
        </script>
    </body>
</html>
