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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

    </head>
    <body>
        <%@include file="header.jspf" %>

        <div class="container mt-5">
            <h2 class="text-center">${product.productName}</h2>

            <div class="row">
                <div class="col-md-6">
                    <img src="<c:url value='../Workshop1${product.productImage}'/>" 
                         class="img-fluid rounded" alt="${product.productName}">
                </div>
                <div class="col-md-6">
                    <p><strong>Product ID:</strong> ${product.productId}</p>
                    <p><strong>Category:</strong> ${product.typeId.categoryName}</p>
                    <p><strong>Description:</strong> ${product.brief}</p>
                    <p><strong>Price:</strong> $${product.price}</p>
                    <p><strong>Discount:</strong> ${product.discount}%</p>
                    <p><strong>Posted Date:</strong> ${product.postedDate}</p>

                    <a href="${pageContext.request.contextPath}/productDisplay" class="btn btn-secondary">Back to Product List</a>
                </div>
            </div>
        </div>

        <c:if test="${not empty sessionScope.viewedProducts}">
            <div class="mt-5">
                <h3 class="text-center">Recently Viewed Products</h3>
                <div class="row">
                    <c:forEach var="viewedProduct" items="${sessionScope.viewedProducts}">
                        <div class="col-md-3">
                            <a href="ProductDetails?productId=${viewedProduct.productId}" class="text-decoration-none">
                                <div class="card mb-3 shadow">
                                    <img src="<c:url value='../Workshop1${viewedProduct.productImage}'/>" 
                                         class="card-img-top" style="height: 200px; object-fit: cover;">
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
</html>F
