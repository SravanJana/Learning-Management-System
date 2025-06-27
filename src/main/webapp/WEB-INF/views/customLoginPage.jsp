<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .footer {
            background-color: black;
            color: white;
            text-align: center;
            padding: 10px;
            width: 100%;
        }

        .login-container {
            width: 500px;  
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        .alert-note {
            background-color: #e3f2fd;
            border-left: 5px solid #0d6efd;
            padding: 15px;
            font-size: 14px;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        .alert-note strong {
            font-size: 16px;
            color: #0d6efd;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container-fluid px-5">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/home" style="font-family: Roboto;font-size: 24px">LMS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/home">Home</a>
                </li>
            </ul>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/customLogin" class="btn btn-outline-primary me-2">Login</a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/register" class="btn btn-primary">Register</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Login Form -->
<div class="container">
    <div class="login-container">
        <h2 class="text-center" style="font-weight: bold">Login</h2>

        <!-- Improved Note Box -->
        <div class="alert alert-note">
            <strong>Note:</strong><br>
            1. Do not use personal credentials for registration.<br>
            2. Log in to the admin dashboard using "admin" as both the username and password.
        </div>

        <c:if test="${param.error != null}">
            <div class="alert alert-danger">Invalid username or password</div>
        </c:if>
        <c:if test="${param.logout != null}">
            <div class="alert alert-success">You have been successfully logged out</div>
        </c:if>

        <form:form action="processLogin" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn btn-primary login-btn w-100">Login</button>
        </form:form>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p>&copy; 2025 LMS | All Rights Reserved</p>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
