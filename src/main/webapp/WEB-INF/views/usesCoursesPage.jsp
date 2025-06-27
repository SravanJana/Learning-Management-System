<%--
  Created by IntelliJ IDEA.
  User: SRAVAN
  Date: 29-01-2025
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <title>Available Courses</title>

    <style>
         
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 10px;
        }

         
        .navbar {
            background-color: white;
            padding: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            text-decoration: none;
        }

        .nav-link {
            font-size: 16px;
            font-weight: 500;
            color: #007bff;
        }

        .nav-link:hover {
            color: #0056b3;
        }

         
        .container {
            background: white;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            max-width: 900px;
            margin: auto;
            padding: 20px;
        }

         
        h1 {
            text-align: center;
            font-size: 30px;
            color: #333;
            margin-bottom: 20px;
        }

         
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

         
        .btn-primary {
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
            padding: 10px 15px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

         
        .footer {
            background-color: #222;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: 30px;
            border-radius: 8px;
        }

         
        @media (max-width: 768px) {
            table {
                display: block;
                overflow-x: auto;
            }
        }

    </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/userPageNext" style="font-size: 24px;font-family: 'Poppins', sans-serif">LMS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/userPageNext">Home</a>
                </li>
            </ul>

            <!-- Search & Logout -->
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

<!-- Main Content -->
<div class="container">
    <h1>Available Courses</h1>
    <table>
        <thead>
        <tr>
            <th>Course Name</th>
            <th>Duration</th>
            <th>Instructor</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="course" items="${courses}">
            <tr>
                <td>${course.courseName}</td>
                <td>${course.courseDuration}</td>
                <td>${course.instructor.instructorName}</td>
                <td><a href="${pageContext.request.contextPath}/userCourseOverview?courseId=${course.course_id}" class="btn-primary">View</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Footer -->
<div class="footer">
    &copy; 2025 LMS | All Rights Reserved
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
