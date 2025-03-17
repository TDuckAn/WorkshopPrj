<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Explore</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/explore.css">
</head>
<body>
    <%@include file="header.jspf" %>

    <div class="container mt-5">
        <h2 class="text-center text-purple">Product List</h2>
        
        <form action="searchProduct" method="GET" class="mb-4">
            <div class="row g-2">
                <div class="col-md-3">
                    <input type="text" name="searchQuery" class="form-control search-input" placeholder="Search product..." value="${searchQuery}">
                </div>
                <div class="col-md-3">
                    <select name="categoryId" class="form-select custom-select">
                        <option value="">All Categories</option>
                        <c:forEach var="category" items="${categoryList}">
                            <option value="${category.typeId}" ${categoryId == category.typeId ? 'selected' : ''}>${category.categoryName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-2">
                    <select name="priceRange" class="form-select custom-select">
                        <option value="">All Prices</option>
                        <option value="low" ${priceRange == 'low' ? 'selected' : ''}>Below 5,000,000</option>
                        <option value="medium" ${priceRange == 'medium' ? 'selected' : ''}>5,000,000 - 15,000,000</option>
                        <option value="high" ${priceRange == 'high' ? 'selected' : ''}>Above 15,000,000</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select name="discountFilter" class="form-select custom-select">
                        <option value="">All Discounts</option>
                        <option value="discounted" ${discountFilter == 'discounted' ? 'selected' : ''}>Discounted</option>
                        <option value="non-discounted" ${discountFilter == 'non-discounted' ? 'selected' : ''}>Non-Discounted</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select name="sortOrder" class="form-select custom-select">
                        <option value="">Sort by Price</option>
                        <option value="asc" ${sortOrder == 'asc' ? 'selected' : ''}>Low to High</option>
                        <option value="desc" ${sortOrder == 'desc' ? 'selected' : ''}>High to Low</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-purple w-100"><i class="bi bi-search"></i> Search</button>
                </div>
            </div>
        </form>

        <div class="row row-cols-1 row-cols-md-3 g-3">
            <c:forEach var="product" items="${productList}">
                <div class="col">
                    <div class="card product-card">
                        <c:if test="${product.discount > 0}">
                            <div class="discount-tag">-${product.discount}%</div>
                        </c:if>
                        <a href="ProductDetails?productId=${product.productId}">
                            <img src="<c:url value='../Workshop1${product.productImage}'/>" class="card-img-top product-img">
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">${product.productName}</h5>
                            <p class="card-text">Category: ${product.typeId.typeId}</p>
                            <p class="text-success fw-bold">$${product.price}</p>
                            <a href="ProductDetails?productId=${product.productId}" class="btn btn-purple w-100">View Details</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>