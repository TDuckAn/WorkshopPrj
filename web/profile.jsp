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

    // Determine gender-based profile image
    String profileImage = user.isGender() ? "male.png" : "female.png";
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

                <div class="row align-items-center">
                    <div class="col-md-4 text-center">
                        <img src="${pageContext.request.contextPath}/images/<%= user.isGender() ? "img_avatar1.png" : "img_avatar2.png"%>" 
                             class="profile-img" alt="Profile Image">
                    </div>

                    <div class="col-md-8">
                        <h5><i class="bi bi-person-circle"></i> Name: <span class="text-primary"><%= user.getLastName() + " " + user.getFirstName()%></span></h5>
                        <h5><i class="bi bi-person-badge"></i> Account: <span class="text-secondary"><%= user.getAccount()%></span></h5>
                        <h5><i class="bi bi-phone"></i> Phone: <span class="text-secondary"><%= user.getPhone()%></span></h5>
                        <h5><i class="bi bi-gender-ambiguous"></i> Gender: 
                            <span class="badge bg-<%= user.isGender() ? "info" : "warning"%>">
                                <%= user.isGender() ? "Male" : "Female"%>
                            </span>
                        </h5>
                        <h5><i class="bi bi-cash"></i> Wealth Status: 
                            <span class="badge bg-<%= "Poor".equals(wealthStatus) ? "danger" : ("Normal".equals(wealthStatus) ? "primary" : "success")%>">
                                <%= wealthStatus != null ? wealthStatus : "Unknown"%>
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
