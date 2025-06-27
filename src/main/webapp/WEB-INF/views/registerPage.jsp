<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>

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
        .navbar {
            background-color: white;
            padding: 10px 0;
        }
        .navbar-brand {
            font-size: 22px;
            font-weight: bold;
            color: black !important;
        }
        .navbar-nav .nav-link {
            font-weight: 500;
            font-size: 16px;
            color: black !important;
        }
        .btn-outline-primary {
            color: #0D6EFD;
            border-color: #0D6EFD;
        }
        .btn-outline-primary:hover {
            background-color: #0D6EFD;
            color: white;
        }
        .btn-primary {
            background-color: #0D6EFD;
            border: none;
        }

        .register-container {
            width: 500px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            background-color: white;
        }
        .register-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .register-container .form-control {
            margin-bottom: 15px;
        }
        .register-btn {
            width: 100%;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        .error {
            color: red;
            font-size: 15px;
            font-style: italic;
            margin-bottom: 2px;
            text-align: left;
            margin-left: 270px;
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

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container-fluid px-5">

        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/home" style="font-family: Roboto,serif;font-size: 24px">LMS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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

<div class="container" >
    <div class="register-container">
        <h2 style="text-align: center;font-weight: bold">Register</h2>
        <div class="alert alert-note">
            <strong>Note:</strong><br>
            1. Do not use personal credentials for registration.<br>
            2. Log in to the admin dashboard using "admin" as both the username and password.
        </div>

        <form:form modelAttribute="regDTO" method="POST" action="processRegistration">
            <div class="mb-3">
                <label for="name" class="form-label">Your Name</label>
                <form:errors path="name" cssClass="error"/>
                <form:input path="name" class="form-control" placeholder="Enter your name"  />
            </div>

            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <form:errors path="name" cssClass="error"/>
                <form:input path="userName" class="form-control" placeholder="Enter your username" />
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <form:errors path="name" cssClass="error"/>
                <form:input path="email" class="form-control" placeholder="Enter your email" />
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <form:errors path="name" cssClass="error"/>
                <form:password path="password" class="form-control" placeholder="Enter your password" />
            </div>

            <button type="submit" class="btn btn-primary register-btn">Register</button>
        </form:form>
    </div>
</div>

<footer class="footer">
    <div class="container" >
        <p >&copy; 2025 LMS  | All Rights Reserved</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
