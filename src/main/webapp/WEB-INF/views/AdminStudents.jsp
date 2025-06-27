<%--
  Created by IntelliJ IDEA.
  User: SRAVAN
  Date: 02-03-2025
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard - LMS</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
     
    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(to right, #eef2f3, #8e9eab);
      margin: 0;
      padding: 0;
      animation: fadeIn 1s ease-in-out;
    }

     
    .sidebar {
      width: 220px;
      height: 100vh;
      position: fixed;
      background: #222;
      color: white;
      padding-top: 20px;
      transition: 0.3s ease-in-out;
    }

    .sidebar a {
      display: block;
      color: white;
      padding: 12px;
      margin: 10px 0;
      text-decoration: none;
      border-radius: 5px;
      transition: 0.3s;
      text-align: center;
    }

    .sidebar a:hover {
      background: #3498db;
      transform: scale(1.05);
    }

     
    .main-content {
      margin-left: 240px;
      padding: 20px;
      margin-top: 60px;
      animation: slideIn 0.8s ease-in-out;
    }

     
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      background: white;
      border-radius: 8px;
      overflow: hidden;
    }

    table, th, td {
      border: none;
    }

    th, td {
      padding: 15px;
      text-align: left;
    }

    th {
      background: #007BFF;
      color: white;
      font-size: 16px;
    }

    tbody tr {
      transition: 0.3s;
    }

    tbody tr:hover {
      background: rgba(0, 123, 255, 0.1);
      transform: scale(1.01);
    }

     
    .green, .blue, .red {
      color: white;
      border: none;
      padding: 10px 15px;
      font-size: 14px;
      border-radius: 10px;
      cursor: pointer;
      display: block;
      text-decoration: none;
      text-align: center;
      transition: 0.3s ease-in-out;
    }

    .green { background-color: #2ecc71; }
    .blue { background-color: #2980b9; }
    .red { background-color: #e74c3c; }

    .green:hover { background-color: #27ae60; transform: scale(1.05); }
    .blue:hover { background-color: #1a5276; transform: scale(1.05); }
    .red:hover { background-color: #c0392b; transform: scale(1.05); }

     
    @keyframes fadeIn {
      from { opacity: 0; }
      to { opacity: 1; }
    }

    @keyframes slideIn {
      from { transform: translateY(20px); opacity: 0; }
      to { transform: translateY(0); opacity: 1; }
    }
  </style>
</head>

<body>
<!-- Navigation Bar (Kept Same as Requested) -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm fixed-top">
  <div class="container-fluid px-5">

    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/adminPage"
       style="font-family: Roboto, serif; font-size: 24px;">LMS</a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/adminPage">Home</a></li>
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/addInstructorPage">Add Instructor</a></li>
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/addNewCourse">Add Course</a></li>
      </ul>
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a href="${pageContext.request.contextPath}/logout" class="btn btn-primary">Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Sidebar -->
<div class="sidebar">
  <a href="${pageContext.request.contextPath}/adminPage">Dashboard</a>
  <a href="${pageContext.request.contextPath}/courses">Manage Courses</a>
  <a href="${pageContext.request.contextPath}/instructor">Manage Instructors</a>
  <a href="${pageContext.request.contextPath}/students">Manage Students</a>
</div>

<!-- Main Content -->
<div class="main-content">
  <div class="container">
    <h1 style="text-align: center;">Students Registered</h1>

    <table>
      <thead>
      <tr>
        <th>Name</th>
        <th>User Name</th>
        <th>Password</th>
        <th></th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="student" items="${students}">
        <tr>
          <td>${student.yourname}</td>
          <td>${student.userDetailsCPK.username}</td>
          <td>${student.userDetailsCPK.password}</td>
          <td><a class="red" href="${pageContext.request.contextPath}/deleteStudent?studentUserName=${student.userDetailsCPK.username}&password=${student.userDetailsCPK.password}" onclick="return confirm('Are you sure?')">Delete</a></td>
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
