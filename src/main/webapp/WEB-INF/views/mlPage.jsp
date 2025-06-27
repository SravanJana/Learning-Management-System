<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Learn Machine Learning</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <style>
    body { font-family: 'Poppins', sans-serif; color: #333; }
    h1, h2, h3 { font-family: 'Montserrat', sans-serif; font-weight: 600; }
    .hero { background-color: #ff6600; color: white; padding: 50px 0; text-align: center; }
    .content-section { padding: 50px 0; }
    .footer { background: black; color: wheat; padding: 20px 0; text-align: center; }
    .btn-learn { background-color: #28a745; color: white; font-weight: bold; }
  </style>
</head>

<body>

<!-- ✅ Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
  <div class="container-fluid px-5">
    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/home">LMS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/home">Home</a>
        </li>

      </ul>

      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a href="${pageContext.request.contextPath}/customLogin" class="btn btn-outline-primary me-2">Login</a></li>
        <li class="nav-item"><a href="${pageContext.request.contextPath}/register" class="btn btn-primary">Register</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- ✅ Hero Section -->
<div class="hero">
  <div class="container">
    <h1>Learn Machine Learning</h1>
    <p>Master AI and ML with Python, TensorFlow, and real-world projects.</p>
    <a href="${pageContext.request.contextPath}/register" class="btn btn-learn btn-lg">Start Learning</a>
  </div>
</div>

<!-- ✅ What is Machine Learning? -->
<div class="container content-section">
  <h2 class="text-center">What is Machine Learning?</h2>
  <p class="text-center">Machine Learning (ML) is a branch of AI that allows computers to learn from data and make predictions.</p>
  <div class="row mt-4">
    <div class="col-md-6">
      <h3>🔹 Applications</h3>
      <ul>
        <li>Self-driving Cars</li>
        <li>Recommendation Systems (Netflix, YouTube)</li>
        <li>Fraud Detection in Banking</li>
      </ul>
    </div>
    <div class="col-md-6">
      <h3>🔹 ML Technologies</h3>
      <ul>
        <li>Supervised & Unsupervised Learning</li>
        <li>Deep Learning (Neural Networks)</li>
        <li>Data Science & Big Data</li>
      </ul>
    </div>
  </div>
</div>

<!-- ✅ Call to Action -->
<div class="text-center my-5">
  <h3>🚀 Want to become an AI Engineer?</h3>
  <p>Join our hands-on Machine Learning course today.</p>
  <a href="${pageContext.request.contextPath}/register" class="btn btn-success btn-lg">Enroll Now</a>
</div>

<!-- ✅ Footer -->
<footer class="footer">
  <div class="container">
    <p>&copy; 2025 LMS | All Rights Reserved</p>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
