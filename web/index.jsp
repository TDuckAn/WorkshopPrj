<%-- 
    Document   : index
    Created on : 28-Feb-2025, 08:46:15
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashSet, javax.servlet.ServletContext" %>

<%

    ServletContext context = request.getServletContext();

  
    HashSet<String> uniqueVisitors = (HashSet<String>) context.getAttribute("uniqueVisitors");

    if (uniqueVisitors == null) {
        uniqueVisitors = new HashSet<>();
    }


    String sessionId = session.getId();


    if (!uniqueVisitors.contains(sessionId)) {
        uniqueVisitors.add(sessionId);
        context.setAttribute("uniqueVisitors", uniqueVisitors);
    }

  
    int visitorCount = uniqueVisitors.size();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>ShopBruh</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/index.css">
    </head>
    
    <body>
        <%@include file="header.jspf" %>

        <div class="container">
            <h1 class="title">Welcome to ShopBruh</h1>
            <p class="visitor-count">Visitors in the last 24 hours: <strong><%= visitorCount %></strong></p>
        </div>
    </body>
</html>
