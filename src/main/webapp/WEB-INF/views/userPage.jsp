<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LMS Home</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

  <style>
     
    body {
      font-family: 'Poppins', sans-serif;
      color: #333;
      background-color: #f8f9fa;
    }

    h1, h2, h3 {
      font-family: 'Montserrat', sans-serif;
      font-weight: 600;
      color: #222;
    }

    p {
      font-size: 18px;
      font-weight: 300;
      color: #555;
    }

     
    .hero {
      background: linear-gradient(135deg, #007bff, #00d4ff);
      text-align: center;
      color: white;
      padding: 100px 20px;
      border-radius: 0 0 50px 50px;
      animation: fadeIn 1.5s ease-in-out;
    }

    .hero h1 {
      font-size: 48px;
      font-weight: bold;
      text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
    }

    .hero p {
      font-size: 20px;
      margin-bottom: 20px;
    }

    .hero .btn {
      font-size: 18px;
      padding: 12px 24px;
      border-radius: 50px;
      transition: all 0.3s ease-in-out;
      background-color: white;
      color: #007bff;
      border: 2px solid white;
    }

    .hero .btn:hover {
      background-color: transparent;
      color: white;
      border: 2px solid white;
      transform: scale(1.05);
    }

     
    .features {
      padding: 60px 0;
      background-color: white;
    }

    .features .feature-box {
      text-align: center;
      padding: 20px;
      transition: 0.3s ease-in-out;
      border-radius: 10px;
      background: #f8f9fa;
      box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
      margin: 15px 0;
    }

    .features .feature-box:hover {
      transform: translateY(-5px);
      box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.2);
    }

     
    .courses {
      padding: 60px 0;
      background-color: #f8f9fa;
      text-align: center;
    }

    .courses h2 {
      margin-bottom: 30px;
      font-size: 36px;
    }

    .course-card {
      transition: 0.3s ease-in-out;
      border-radius: 10px;
      background: white;
      padding: 20px;
      box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }

    .course-card:hover {
      transform: scale(1.05);
      box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
    }

     
    .footer {
      background: black;
      color: wheat;
      padding: 20px 0;
      text-align: center;
    }

     
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-10px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>

<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
  <div class="container-fluid px-5">
    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/userPage" style="font-family: Roboto,serif">LMS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/userPage">Home</a>
        </li>
      </ul>
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-primary me-2">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Hero Section -->
<div class="hero">
  <div class="container">
    <h1>Welcome to Your Learning Journey</h1>
    <p>Discover new skills, track progress, and achieve success!</p>
    <a href="${pageContext.request.contextPath}/userPageNext" class="btn">Get Started</a>
  </div>
</div>

<!-- Features Section -->
<div class="container features">
  <div class="row">
    <div class="col-md-4">
      <div class="feature-box">
        <h3>Personalized Learning</h3>
        <p>Get access to customized courses based on your skills.</p>
      </div>
    </div>
    <div class="col-md-4">
      <div class="feature-box">
        <h3>Expert Instructors</h3>
        <p>Learn from industry professionals with real-world experience.</p>
      </div>
    </div>
    <div class="col-md-4">
      <div class="feature-box">
        <h3>Certifications</h3>
        <p>Earn certificates to showcase your expertise and enhance your career.</p>
      </div>
    </div>
  </div>
</div>

<!-- Courses Section -->
<div class="container courses">
  <h2>Explore Our Courses</h2>
  <div class="row">
    <div class="col-md-6">
      <div class="course-card">
        <h4>Java Programming</h4>
        <p>Master Java and build powerful applications with hands-on projects.</p>
      </div>
    </div>
    <div class="col-md-6">
      <div class="course-card">
        <h4>Spring Boot</h4>
        <p>Develop modern web applications with Spring Boot and Hibernate.</p>
      </div>
    </div>
  </div>
</div>

<!-- Footer -->
<footer class="footer">
  <p>&copy; 2025 LMS | All Rights Reserved</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
