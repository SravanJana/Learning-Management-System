<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Home</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">

  <style>
     
    body {
      background-color: #f8f9fa;
      font-family: 'Poppins', sans-serif;
      overflow-x: hidden;
    }

     
    .fade-in {
      opacity: 0;
      transform: translateY(20px);
      transition: opacity 0.6s ease-out, transform 0.6s ease-out;
    }

    .fade-in.visible {
      opacity: 1;
      transform: translateY(0);
    }

     
    .navbar {
      transition: background 0.3s;
    }
    .navbar-brand {
      font-family: 'Roboto', serif;
      font-size: 24px;
    }

     
    .hero {
      background: linear-gradient(to right, #007bff, #0056b3);
      color: white;
      padding: 60px 20px;
      text-align: center;
      border-radius: 10px;
      margin-bottom: 30px;
      animation: fadeInUp 1s ease-out;
    }

     
    .card {
      border-radius: 15px;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      text-align: center;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    .card:hover {
      transform: scale(1.05);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

     
    .course-card {
      background: white;
      padding: 20px;
      border-radius: 10px;
      text-align: center;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .course-card:hover {
      transform: scale(1.05);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

     
    .testimonial {
      background: #ffffff;
      padding: 20px;
      border-radius: 10px;
      text-align: center;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease-in-out;
    }

    .testimonial:hover {
      transform: scale(1.05);
    }

     
    .footer {
      background-color: black;
      color: white;
      text-align: center;
      padding: 10px;
      width: 100%;
      margin-top: 30px;
    }

     
    .btn-custom {
      background-color: #ff9800;
      color: white;
      border-radius: 25px;
      font-size: 18px;
      padding: 12px 20px;
      font-weight: bold;
      transition: background 0.3s, transform 0.2s;
    }

    .btn-custom:hover {
      background-color: #e68900;
      transform: scale(1.05);
    }

     
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(50px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

  </style>
</head>
<body>

<!-- ✅ Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
  <div class="container-fluid px-5">
    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/userPage">LMS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
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

<!-- ✅ Hero Section -->
<div class="container fade-in">
  <div class="hero">
    <h1>Welcome to Your LMS Dashboard</h1>
    <p>Enhance your skills with expert-led courses and interactive learning.</p>
  </div>
</div>

<!-- ✅ User Options -->
<div class="container">
  <div class="row">
    <div class="col-md-6 fade-in">
      <div class="card p-3">
        <h4>Available Instructors</h4>
        <p>View and connect with top instructors.</p>
        <a href="${pageContext.request.contextPath}/userInstructors" class="btn btn-custom">🔥 View Instructors</a>
      </div>
    </div>
    <div class="col-md-6 fade-in">
      <div class="card p-3">
        <h4>Your Courses</h4>
        <p>Explore courses and lessons assigned to you.</p>
        <a href="${pageContext.request.contextPath}/userCourses" class="btn btn-custom">📚 View Courses</a>
      </div>
    </div>
  </div>
</div>

<!-- ✅ Featured Courses -->
<div class="container mt-5">
  <h2 class="text-center fade-in">Popular Courses</h2>
  <div class="row mt-4">
    <div class="col-md-4 fade-in">
      <div class="course-card">
        <h4>Java Programming</h4>
        <p>Master Java from basics to advanced topics.</p>
        <a href="${pageContext.request.contextPath}/userCourseOverview?courseId=2" class="btn btn-custom">Learn More</a>
      </div>
    </div>
    <div class="col-md-4 fade-in">
      <div class="course-card">
        <h4>Machine Learning</h4>
        <p>Explore AI and ML with real-world projects.</p>
        <a href="${pageContext.request.contextPath}/userCourseOverview?courseId=10" class="btn btn-custom">Learn More</a>
      </div>
    </div>
    <div class="col-md-4 fade-in">
      <div class="course-card">
        <h4>Spring Framework</h4>
        <p>Learn Spring and Spring MVC.</p>
        <a href="${pageContext.request.contextPath}/userCourseOverview?courseId=1" class="btn btn-custom">Learn More</a>
      </div>
    </div>
  </div>
</div>

<!-- ✅ Footer -->
<footer class="footer">
  <div class="container">
    <p>&copy; 2025 LMS | All Rights Reserved</p>
  </div>
</footer>

<script>
  // Apply fade-in effect on scroll
  document.addEventListener("DOMContentLoaded", function() {
    let elements = document.querySelectorAll(".fade-in");
    elements.forEach(el => {
      el.classList.add("visible");
    });
  });
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
