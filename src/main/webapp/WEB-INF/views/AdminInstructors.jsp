<%--
  Created by IntelliJ IDEA.
  User: SRAVAN
  Date: 02-03-2025
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      background-color: #f4f4f4;
      animation: fadeIn 1s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }

     
    .sidebar {
      width: 200px;
      height: 100vh;
      position: fixed;
      background: linear-gradient(135deg, #333, #222);
      color: white;
      padding-top: 20px;
      transition: all 0.3s ease-in-out;
    }

    .sidebar a {
      display: block;
      color: white;
      padding: 12px;
      text-decoration: none;
      margin: 10px 0;
      transition: all 0.3s ease-in-out;
    }

    .sidebar a:hover {
      background-color: #007bff;
      padding-left: 20px;
    }

     
    .main-content {
      margin-left: 220px;
      padding: 20px;
      margin-top: 60px;
    }

     
    .stats {
      display: flex;
      justify-content: space-around;
      margin-top: 20px;
      animation: fadeIn 1.5s ease-in-out;
    }

    .stat-box {
      background: linear-gradient(135deg, #007BFF, #0056b3);
      color: white;
      padding: 20px;
      border-radius: 8px;
      text-align: center;
      width: 30%;
      transition: transform 0.3s ease-in-out;
    }

    .stat-box:hover {
      transform: scale(1.05);
      box-shadow: 0 6px 15px rgba(0, 123, 255, 0.3);
    }

     
    .card {
      background: white;
      padding: 20px;
      margin: 20px 0;
      box-shadow: 2px 2px 15px rgba(0,0,0,0.1);
      border-radius: 8px;
      transition: all 0.3s ease-in-out;
      animation: fadeIn 1.5s ease-in-out;
    }

    .card:hover {
      transform: scale(1.02);
    }

     
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      animation: fadeIn 1.5s ease-in-out;
    }

    table, th, td {
      border: 1px solid #ddd;
    }

    th, td {
      padding: 12px;
      text-align: left;
      transition: background 0.3s ease-in-out;
    }

    th {
      background: #007BFF;
      color: white;
    }

    tr:hover {
      background: #f1f1f1;
    }

     
    .btn-custom {
      padding: 10px 15px;
      font-size: 14px;
      font-weight: bold;
      border-radius: 6px;
      transition: all 0.3s ease-in-out;
    }

    .btn-green {
      background: linear-gradient(135deg, #28a745, #1e7e34);
      color: white;
      border: none;
      text-decoration: none;
    }

    .btn-green:hover {
      background: linear-gradient(135deg, #1e7e34, #155d27);
      transform: scale(1.1);
    }

    .btn-blue {
      background: linear-gradient(135deg, #007bff, #0056b3);
      color: white;
      border: none;
      text-decoration: none;

    }

    .btn-blue:hover {
      background: linear-gradient(135deg, #0056b3, #0048a1);
      transform: scale(1.1);
    }

    .btn-red {
      background: linear-gradient(135deg, #dc3545, #a71d2a);
      color: white;
      border: none;
      text-decoration: none;

    }

    .btn-red:hover {
      background: linear-gradient(135deg, #a71d2a, #82121d);
      transform: scale(1.1);
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

<div class="sidebar">
  <a href="${pageContext.request.contextPath}/adminPage">Dashboard</a>
  <a href="${pageContext.request.contextPath}/courses">Manage Courses</a>
  <a href="${pageContext.request.contextPath}/instructor">Manage Instructors</a>
  <a href="${pageContext.request.contextPath}/students">Manage Students</a>
</div>

<div class="main-content">
  <h1 style="text-align: center">Available Instructors</h1>
  <table>
    <thead>
    <tr><th>Name</th><th>Experience</th><th>Email</th><th>Courses</th><th></th><th></th><th></th></tr>
    </thead>
    <tbody>
    <c:forEach var="inst" items="${instructors}">
      <tr>
        <td>${inst.instructorName}</td>
        <td>${inst.instructorEXP}</td>
        <td>${inst.instructorEmail}</td>
        <td><a class="btn-green btn-custom" href="${pageContext.request.contextPath}/addNewCourse">Add Course</a></td>
        <td><a class="btn-blue btn-custom" href="${pageContext.request.contextPath}/updateInstructor?userID=${inst.id}">Edit</a></td>
        <td><a class="btn-red btn-custom" href="${pageContext.request.contextPath}/deleteInstructor?userID=${inst.id}" onclick="return confirm('Are you sure?')">Delete</a></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
