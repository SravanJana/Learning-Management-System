<%-- Created by IntelliJ IDEA. User: SRAVAN --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard - LMS</title>

  <style>
     
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }

     
    .sidebar {
      width: 220px;
      height: 100vh;
      position: fixed;
      background-color: #333;
      color: white;
      padding-top: 20px;
      transition: all 0.3s ease-in-out;
    }

    .sidebar:hover {
      width: 250px;
    }

    .sidebar a {
      display: block;
      color: white;
      padding: 12px 20px;
      text-decoration: none;
      margin: 10px 0;
      font-size: 16px;
      transition: all 0.3s ease;
    }

    .sidebar a:hover {
      background-color: #007BFF;
      padding-left: 30px;
    }

     
    .main-content {
      margin-left: 240px;
      padding: 20px;
      margin-top: 60px;
    }

     
    .card {
      background: white;
      padding: 20px;
      margin: 20px 0;
      box-shadow: 2px 2px 15px rgba(0,0,0,0.1);
      border-radius: 8px;
      transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 3px 3px 20px rgba(0, 0, 0, 0.2);
    }

     
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      background: white;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 2px 2px 15px rgba(0,0,0,0.1);
    }

    table, th, td {
      border: 1px solid #ddd;
      text-align: left;
    }

    th, td {
      padding: 12px;
    }

    th {
      background: #007BFF;
      color: white;
      text-transform: uppercase;
    }

    tr:hover {
      background-color: #f1f1f1;
      transition: 0.3s ease-in-out;
    }

     
    .btn-custom {
      display: inline-block;
      padding: 8px 12px;
      border-radius: 20px;
      font-size: 14px;
      text-align: center;
      cursor: pointer;
      transition: all 0.3s ease-in-out;
      text-decoration: none;
    }

    .green { background-color: #4CAF50; color: white; }
    .blue { background-color: #345be3; color: white; }
    .red { background-color: #f40909; color: white; }

    .green:hover { background-color: #45a049; transform: scale(1.05); }
    .blue:hover { background-color: #2672b8; transform: scale(1.05); }
    .red:hover { background-color: #d90404; transform: scale(1.05); }

     
    .sidebar-container {
      margin-top: 60px;
    }
  </style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm fixed-top">
  <div class="container-fluid px-5">

    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/adminPage" style="font-family: Roboto,serif;font-size: 24px ">LMS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/adminPage" style="font-size: 15px">Home</a>
        </li>
      </ul>

      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/addInstructorPage" style="font-size: 15px">Add Instructor</a>
        </li>
      </ul>

      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/addNewCourse" style="font-size: 15px">Add Course</a>
        </li>
      </ul>

      <ul class="navbar-nav ms-auto">  <!-- Pushes buttons to the right -->

        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/logout" class="btn btn-primary">Logout</a>

        </li>
      </ul>

    </div>
  </div>
</nav>

<div class="sidebar-container">
  <div class="sidebar">
    <a href="${pageContext.request.contextPath}/adminPage">Dashboard</a>
    <a href="${pageContext.request.contextPath}/courses">Manage Courses</a>
    <a href="${pageContext.request.contextPath}/instructor">Manage Instructors</a>
    <a href="${pageContext.request.contextPath}/students">Manage Students</a>
  </div>
</div>

<div class="main-content">
  <div class="container">
    <h1 class="text-center">Available Courses</h1>

    <table>
      <thead>
      <tr>
        <th>Course Name</th>
        <th>Course Duration</th>
        <th></th>
        <th></th>
        <th></th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="course" items="${courses}">
        <tr>
          <td>${course.courseName}</td>
          <td>${course.courseDuration}</td>
          <td><a class="btn-custom green" href="${pageContext.request.contextPath}/courseOverview?courseId=${course.course_id}">View</a></td>
          <td><a class="btn-custom blue" href="${pageContext.request.contextPath}/editCourse?courseID=${course.course_id}">Edit</a></td>
          <td><a class="btn-custom red" href="${pageContext.request.contextPath}/deleteCourse?courseID=${course.course_id}" onclick="return confirm('Are you sure?')">Delete</a></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
