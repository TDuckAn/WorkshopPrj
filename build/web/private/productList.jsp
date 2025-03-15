<%-- 
    Document   : productList
    Created on : 02-Mar-2025, 18:36:14
    Author     : Admin
--%>

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
        <title>Product List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

    </head>
    <body>
        <%@include file="../header.jspf" %>

        <div class="container mt-5">
            <h2 class="text-center">Product List</h2>
            <table class="table table-bordered table-hover text-center align-middle">
                <thead class="table-dark">
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Image</th>
                        <th>Brief</th>
                        <th>Category ID</th> 
                        <th>Account ID</th> 
                        <th>Price</th>
                        <th>Discount</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${productList}">
                        <tr>
                            <td>${product.productId}</td>
                            <td>${product.productName}</td>
                            <td><img src="<c:url value='../Workshop1${product.productImage}'/>" style="width: 150px; height: 150px; object-fit: cover;"></td>
                            <td>${product.brief}</td>
                            <td>${product.typeId != null ? product.typeId.typeId : 'N/A'}</td> 
                            <td>${product.account != null ? product.account.account : 'N/A'}</td> 
                            <td>$${product.price}</td>
                            <td>${product.discount}%</td>
                            <td>
                                <a href="private/productUpdate.jsp?productId=${product.productId}" class="btn btn-primary btn-sm">
                                    <i class="bi bi-pencil"></i> Update
                                </a>
                                <a href="deleteProduct?productId=${product.productId}" 
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirmDelete('${product.productName}');">
                                    <i class="bi bi-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="index.jsp" class="btn btn-primary">Back to Home</a>
        </div>

        <script>
            function confirmDelete(productName) {
                return confirm("Are you sure you want to delete '" + productName + "'?");
            }
        </script>
    </body>
</html>
