<%-- 
    Document   : Explore
    Created on : 13-Mar-2025, 22:51:23
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Explore</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

    </head>
    <body>
        <%@include file="header.jspf" %>

        <div class="container mt-5">
            <h2 class="text-center">Product List</h2> 
            <form action="searchProduct" method="GET" class="mb-4"> 
                <div class="row g-2">
                    <div class="col-md-4">
                        <input type="text" name="searchQuery" class="form-control" 
                               placeholder="Search product..." value="${searchQuery}">
                    </div>

                    <div class="col-md-2">
                        <select name="categoryId" class="form-select">
                            <option value="">All Categories</option>
                            <c:forEach var="category" items="${categoryList}">
                                <option value="${category.typeId}" ${categoryId == category.typeId ? 'selected' : ''}>
                                    ${category.categoryName}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-md-3">
                        <select name="priceRange" class="form-select">
                            <option value="">All Prices</option>
                            <option value="low" ${priceRange == 'low' ? 'selected' : ''}>Below 5,000,000</option>
                            <option value="medium" ${priceRange == 'medium' ? 'selected' : ''}>5,000,000 - 15,000,000</option>
                            <option value="high" ${priceRange == 'high' ? 'selected' : ''}>Above 15,000,000</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select name="discountFilter" class="form-select">
                            <option value="">All Discounts</option>
                            <option value="discounted" ${discountFilter == 'discounted' ? 'selected' : ''}>Discounted</option>
                            <option value="non-discounted" ${discountFilter == 'non-discounted' ? 'selected' : ''}>Non-Discounted</option>
                        </select>
                    </div>

                    <div class="col-md-2">
                        <select name="sortOrder" class="form-select">
                            <option value="">Sort by Price</option>
                            <option value="asc" ${sortOrder == 'asc' ? 'selected' : ''}>Low to High</option>
                            <option value="desc" ${sortOrder == 'desc' ? 'selected' : ''}>High to Low</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary w-100"><i class="bi bi-search"></i> Search</button>
                    </div>
                </div>
            </form>
            <table class="table table-bordered table-hover text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Image</th>
                        <th>Category</th> 
                        <th>Price</th>
                        <th>Discount</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${productList}">
                        <tr>
                            <td>${product.productId}</td>
                            <td>
                                <a href="ProductDetails?productId=${product.productId}" class="text-decoration-none">
                                    ${product.productName}
                                </a>
                            </td>
                            <td>
                                <a href="ProductDetails?productId=${product.productId}">
                                    <img src="<c:url value='../Workshop1${product.productImage}'/>" 
                                         style="width: 150px; height: 150px; object-fit: cover;">
                                </a>
                            </td>
                            <td>${product.typeId.typeId}</td> 
                            <td>$${product.price}</td>
                            <td>${product.discount}%</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

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
            <a href="index.jsp" class="btn btn-primary">Back to Home</a>
        </div>
    </body>
</html>

