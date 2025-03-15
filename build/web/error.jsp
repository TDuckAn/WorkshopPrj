<%-- 
    Document   : error
    Created on : 03-Mar-2025, 10:51:06
    Author     : Admin
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/style.css">

        <title>Error</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                text-align: center;
                padding: 50px;
                background-color: #f8d7da;
            }
            .error-container {
                background: white;
                padding: 20px;
                border-radius: 10px;
                display: inline-block;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                color: #721c24;
            }
            p {
                color: #721c24;
            }
            a {
                text-decoration: none;
                color: #721c24;
                font-weight: bold;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="error-container">
            <h1>Oops! Something went wrong.</h1>
            <p>An unexpected error occurred. Please try again later.</p>
            <p><a href="index.jsp">Return to Home</a></p>
        </div>
    </body>
</html>