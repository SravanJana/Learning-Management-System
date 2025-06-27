<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Learn Spring Framework</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            color: #333;
        }

        h1, h2, h3 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 600;
            color: #222;
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: 600;
        }

        .hero {
            background-color: #0c5460;
            color: white;
            padding: 50px 0;
            text-align: center;
        }

        .content-section {
            padding: 50px 0;
        }

        .footer {
            background: black;
            color: wheat;
            padding: 20px 0;
            text-align: center;
        }

        .btn-learn {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }
    </style>
</head>

<body>

<!-- ✅ Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container-fluid px-5">
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/home" style="font-family: Roboto, serif">LMS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a>
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

<!-- ✅ Hero Section -->
<div class="hero">
    <div class="container">
        <h1>Master the Spring Framework</h1>
        <p>Build robust, scalable, and secure enterprise applications with Spring and Spring Boot.</p>
        <a href="${pageContext.request.contextPath}/register" class="btn btn-learn btn-lg">Start Learning</a>
    </div>
</div>

<!-- ✅ What is Spring Framework? -->
<div class="container content-section">
    <h2 class="text-center">What is the Spring Framework?</h2>
    <p class="text-center">Spring is a powerful, feature-rich framework for developing Java applications. It provides comprehensive support for:</p>

    <div class="row mt-4">
        <div class="col-md-6">
            <h3>🔹 Core Features</h3>
            <ul>
                <li>Inversion of Control (IoC) and Dependency Injection (DI)</li>
                <li>Aspect-Oriented Programming (AOP)</li>
                <li>Spring Expression Language (SpEL)</li>
            </ul>
        </div>
        <div class="col-md-6">
            <h3>🔹 Additional Modules</h3>
            <ul>
                <li>Spring MVC for Web Applications</li>
                <li>Spring Data for Database Access</li>
                <li>Spring Security for Authentication & Authorization</li>
                <li>Spring Boot for Rapid Development</li>
            </ul>
        </div>
    </div>
</div>

<!-- ✅ Why Learn Spring? -->
<div class="container content-section bg-light">
    <h2 class="text-center">Why Learn Spring?</h2>
    <div class="row mt-4">
        <div class="col-md-4 text-center">
            <h3>⚡ High Performance</h3>
            <p>Spring offers efficient memory management and quick application startup.</p>
        </div>
        <div class="col-md-4 text-center">
            <h3>💡 Modern Development</h3>
            <p>Spring Boot makes microservice development effortless with embedded servers.</p>
        </div>
        <div class="col-md-4 text-center">
            <h3>🌍 Industry Standard</h3>
            <p>Spring is widely used by enterprises such as Google, Amazon, and Netflix.</p>
        </div>
    </div>
</div>

<!-- ✅ Introduction to Spring Boot -->
<div class="container content-section">
    <h2 class="text-center">Introduction to Spring Boot</h2>
    <p class="text-center">Spring Boot is a microservice framework that simplifies the development of Java applications with minimal configuration.</p>

    <div class="row mt-4">
        <div class="col-md-6">
            <h3>🚀 Key Features of Spring Boot</h3>
            <ul>
                <li>Auto-Configuration for rapid development</li>
                <li>Embedded Web Servers (Tomcat, Jetty, Undertow)</li>
                <li>Production-ready features (Monitoring, Logging, Metrics)</li>
            </ul>
        </div>
        <div class="col-md-6">
            <h3>🎯 Spring Boot Starter Packs</h3>
            <ul>
                <li>Spring Boot Starter Web (For REST APIs)</li>
                <li>Spring Boot Starter Security (For Authentication)</li>
                <li>Spring Boot Starter Data JPA (For Databases)</li>
            </ul>
        </div>
    </div>
</div>

<!-- ✅ Call to Action -->
<div class="text-center my-5">
    <h3>📚 Ready to become a Spring Expert?</h3>
    <p>Enroll in our comprehensive Spring Framework course today.</p>
    <a href="${pageContext.request.contextPath}/register" class="btn btn-success btn-lg">Enroll Now</a>
</div>

<!-- ✅ Footer -->
<footer class="footer">
    <div class="container">
        <p style="color: white">&copy; 2025 LMS | All Rights Reserved</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
