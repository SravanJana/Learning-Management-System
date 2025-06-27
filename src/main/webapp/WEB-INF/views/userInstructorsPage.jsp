<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Available Instructors</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
     
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f8f9fa;
      padding: 20px;
    }

     
    .container {
      background: white;
      border-radius: 10px;
      box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
      max-width: 95%;
      padding: 20px;
      margin: auto;
    }

     
    h1 {
      text-align: center;
      font-size: 32px;
      color: #007bff;
      margin-bottom: 20px;
      font-weight: bold;
    }

     
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      border-radius: 8px;
      overflow: hidden;
    }

     
    th {
      background-color: #007bff;
      color: white;
      padding: 14px;
      text-align: left;
      font-size: 18px;
    }

     
    td {
      padding: 12px;
      border-bottom: 1px solid #ddd;
      font-size: 16px;
    }

     
    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

     
    tr:hover {
      background-color: #e9ecef;
      transition: 0.3s;
    }

     
    .btn-green {
      background-color: #28a745;
      color: white;
      padding: 8px 12px;
      font-size: 14px;
      border-radius: 8px;
      text-decoration: none;
      display: inline-block;
      text-align: center;
    }

    .btn-green:hover {
      background-color: #218838;
    }

    .btn-blue {
      background-color: #007bff;
      color: white;
      padding: 8px 12px;
      font-size: 14px;
      border-radius: 8px;
      text-decoration: none;
      display: inline-block;
      text-align: center;
    }

    .btn-blue:hover {
      background-color: #0056b3;
    }

     
    .footer {
      background-color: black;
      color: white;
      text-align: center;
      padding: 10px;
      width: 100%;
      margin-top: 20px;
    }
  </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
  <div class="container-fluid px-5">
    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/userPageNext" style="font-size: 24px;font-family: 'Poppins', sans-serif">LMS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/userPageNext">Home</a>
        </li>
      </ul>

      <!-- Search Form and Logout Button -->
      <div class="d-flex align-items-center">
        <div style="margin-top: 16px">

          <form:form action="UserSearchInstructor" class="d-flex me-2" modelAttribute="searchClass">
            <form:input class="form-control form-control-sm me-2" type="search" placeholder="Search for instructor" path="name"/>
            <button class="btn btn-outline-primary me-2" type="submit">Search</button>
          </form:form>

        </div>


        <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-primary me-2">Logout</a>
      </div>
    </div>
  </div>
</nav>

<!-- Page Content -->
<div class="container">
  <h1>Available Instructors</h1>

  <table class="table table-hover">
    <thead>
    <tr>
      <th>Name</th>
      <th>Experience</th>
      <th>Email</th>
      <th>Courses</th>
    </tr>
    </thead>

    <tbody>
    <c:forEach var="inst" items="${instructors}">
      <tr>
        <td style="align-content: center;justify-content: center">${inst.instructorName}</td>
        <td  style="align-content: center;justify-content: center">${inst.instructorEXP} years</td>
        <td  style="align-content: center;justify-content: center">${inst.instructorEmail}</td>
        <td>
          <table class="table">
            <thead>
            <tr>
              <th>Course Name</th>
              <th>Course Duration</th>
              <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="course" items="${inst.courses}">
              <tr>
                <td>${course.courseName}</td>
                <td>${course.courseDuration} months</td>
                <td><a class="btn-green" href="${pageContext.request.contextPath}/userCourseOverview?courseId=${course.course_id}">View Course</a></td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<!-- Footer -->
<footer class="footer">
  <p>&copy; 2025 LMS | All Rights Reserved</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
