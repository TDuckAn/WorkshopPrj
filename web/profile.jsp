<%-- 
    Document   : profile
    Created on : 16-Mar-2025, 18:07:47
    Author     : Admin
--%>


<%@page import="Model.DTOAccount" %>
<%@page import="javax.servlet.http.HttpSession" %>

<%
    // Retrieve logged-in user information
    DTOAccount user = (DTOAccount) session.getAttribute("loggedInUser");
    String wealthStatus = (String) session.getAttribute("wealthStatus");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Profile</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/profile.css">
    </head>
    <body>
        <%@include file="header.jspf" %>

        <div class="container mt-5">
            <div class="card shadow-lg p-4">
                <h2 class="text-center">Profile Information</h2>
                
                <div class="row">
                    <div class="col-md-6">
                        <h5><i class="bi bi-person-circle"></i> Name: <span class="text-primary"><%= user.getLastName() + " " + user.getFirstName() %></span></h5>
                        <h5><i class="bi bi-person-circle"></i> Account: <span class="text-secondary"><%= user.getAccount() %></span></h5>
                        <h5><i class="bi bi-phone"></i> Phone: <span class="text-secondary"><%= user.getPhone() %></span></h5>
                    </div>

                    <div class="col-md-6">
                        <h5><i class="bi bi-person-badge"></i> Role: 
                            <span class="badge bg-<%= user.getRoleInSystem() == 1 ? "warning" : (user.getRoleInSystem() == 2 ? "info" : "success") %>">
                                <%= user.getRoleInSystem() == 1 ? "Admin" : (user.getRoleInSystem() == 2 ? "Staff" : "User") %>
                            </span>
                        </h5>

                        <h5><i class="bi bi-cash"></i> Wealth Status: 
                            <span class="badge bg-<%= "Poor".equals(wealthStatus) ? "danger" : ("Normal".equals(wealthStatus) ? "primary" : "success") %>">
                                <%= wealthStatus != null ? wealthStatus : "Unknown" %>
                            </span>
                        </h5>
                    </div>
                </div>

                <div class="text-center mt-4">
                    <a href="LogoutServlet" class="btn btn-danger"><i class="bi bi-box-arrow-right"></i> Logout</a>
                </div>
            </div>
        </div>
    </body>
</html>

