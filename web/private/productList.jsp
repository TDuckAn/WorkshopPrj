<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Product List</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">
    </head>
    <body class="bg-light">
        <%@include file="../header.jspf" %>

        <div class="container mt-5">
            <div class="card shadow-lg border-0 rounded-4 p-4">
                <h2 class="text-center fw-bold" style="color: #9b59b6;">Product List</h2>

                <div class="table-responsive">
                    <table  class="table table-bordered table-hover text-center align-middle">
                        <thead style="background-color: #9b59b6; color: white" class="table-purple">
                            <tr>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Image</th>
                                <th>Brief</th>
                                <th>Category</th> 
                                <th>Account</th> 
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
                                    <td>
                                        <img src="<c:url value='../Workshop1${product.productImage}'/>" 
                                             class="rounded shadow-sm"
                                             style="width: 100px; height: 100px; object-fit: cover;">
                                    </td>
                                    <td>${product.brief}</td>
                                    <td>${product.typeId != null ? product.typeId.typeId : 'N/A'}</td> 
                                    <td>${product.account != null ? product.account.account : 'N/A'}</td> 
                                    <td><span class="fw-bold text-success">$${product.price}</span></td>
                                    <td><span class="badge bg-warning text-dark">${product.discount}%</span></td>
                                    <td>
                                        <a href="private/productUpdate.jsp?productId=${product.productId}" class="btn btn-sm btn-primary">
                                            <i class="bi bi-pencil"></i> Update
                                        </a>
                                        <a href="deleteProduct?productId=${product.productId}" 
                                           class="btn btn-sm btn-danger"
                                           onclick="return confirmDelete('${product.productName}');">
                                            <i class="bi bi-trash"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="text-center mt-3">
                    <a href="index.jsp" class="btn btn-primary px-4">
                        <i class="bi bi-house-door"></i> Back to Home
                    </a>
                </div>
            </div>
        </div>

        <script>
            function confirmDelete(productName) {
                return confirm("Are you sure you want to delete '" + productName + "'?");
            }
        </script>
    </body>
</html>
