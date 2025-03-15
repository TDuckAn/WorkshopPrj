<%-- 
    Document   : accessDenied
    Created on : 16-Mar-2025, 01:41:51
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Access Denied</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

</head>
<body>
    <div class="container text-center mt-5">
        <h1 class="text-danger">Access Denied</h1>
        <p>You do not have permission to access this page.</p>
        <a href="index.jsp" class="btn btn-primary">Return to Home</a>
    </div>
</body>
</html>
