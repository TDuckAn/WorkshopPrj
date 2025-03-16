<%-- 
    Document   : productDetail
    Created on : 14-Mar-2025, 08:26:24
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Product Details</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    </head>
    <body>
        <%@include file="header.jspf" %>

        <div class="container mt-5">
            <div class="card p-4 shadow-lg rounded-4 border-0 bg-white">
                <h2 class="text-center text-purple fw-bold">${product.productName}</h2>

                <div class="row align-items-center">
                    <!-- Product Image -->
                    <div class="col-md-6">
                        <div class="product-img-container">
                            <img src="<c:url value='../Workshop1${product.productImage}'/>" 
                                 class="product-img img-fluid rounded-4 shadow-sm" 
                                 alt="${product.productName}">
                        </div>
                    </div>

                    <!-- Product Details -->
                    <div class="col-md-6">
                        <div class="p-4 rounded-3 shadow-sm bg-light">
                            <p class="mb-2"><strong>Product ID:</strong> ${product.productId}</p>
                            <p class="mb-2"><strong>Category:</strong> ${product.typeId.categoryName}</p>
                            <p class="mb-2"><strong>Description:</strong> ${product.brief}</p>
                            <p class="mb-2"><strong>Price:</strong> <span class="text-success fw-bold">$${product.price}</span></p>
                            <p class="mb-2"><strong>Discount:</strong> <span class="text-danger fw-bold">${product.discount}%</span></p>
                            <p class="mb-4"><strong>Posted Date:</strong> ${product.postedDate}</p>

                            <a href="${pageContext.request.contextPath}/productDisplay" 
                               class="btn btn-gradient w-100">
                                <i class="bi bi-arrow-left-circle me-2"></i> Back to Product List
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recently Viewed Products -->
        <c:if test="${not empty sessionScope.viewedProducts}">
            <div class="container mt-5">
                <h3 class="text-center text-purple">Recently Viewed Products</h3>
                <div class="row">
                    <c:forEach var="viewedProduct" items="${sessionScope.viewedProducts}">
                        <div class="col-md-3">
                            <a href="ProductDetails?productId=${viewedProduct.productId}" class="text-decoration-none">
                                <div class="card mb-3 shadow product-card">
                                    <div class="product-img-container">
                                        <img src="<c:url value='../Workshop1${viewedProduct.productImage}'/>" 
                                             class="product-img img-fluid rounded-4">
                                    </div>
                                    <div class="card-body text-center">
                                        <h5 class="card-title">${viewedProduct.productName}</h5>
                                        <p class="card-text fw-bold text-primary">$${viewedProduct.price}</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>
    </body>
</html>
