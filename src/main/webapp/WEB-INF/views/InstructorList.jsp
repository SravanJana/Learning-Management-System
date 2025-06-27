<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #d3d3d3;
            margin: 0;
            padding: 0;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            max-width: 1000px;
            margin-left: 210px;
            margin-top: 30px;

        }
        h1 {
            text-align: center;
            font-size: 28px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #222;
            color: white;
            text-align: center;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .green, .blue, .red {
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            border-radius: 10px;
            cursor: pointer;
            display: block;
            margin: 10px auto;
            text-decoration: none;
            text-align: center;
        }
        .green { background-color: #4CAF50; }
        .blue { background-color: #345be3; }
        .red { background-color: #f40909; }
        .green:hover { background-color: #45a049; }
        .blue:hover { background-color: #2672b8; }
        .red:hover { background-color: #d90404; }

        .sidebar {
            width: 200px;
            height: 100vh;
            position: fixed;
            background-color: #333;
            color: white;
            padding-top: 20px;
            margin-top: 47px;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 10px;
            text-decoration: none;
            margin: 10px 0;
        }
        .sidebar a:hover {
            background-color: #555;
        }
    </style>
</head>
<body>

<!-- Navbar (Updated to Match Home Page) -->
<nav class="navbar navbar-expand-lg fixed-top" style="background-color: white; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/instructor"><b>LMS</b></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/instructor">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/addInstructorPage">Add Instructor</a></li>
            </ul>
            <form:form action="searchInstructor" class="d-flex" modelAttribute="searchClass">
                <form:input class="form-control me-2" type="search" placeholder="Search for instructor" path="name"/>
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form:form>
        </div>
    </div>
</nav>
<div class="sidebar">
    <a href="${pageContext.request.contextPath}/instructor">Dashboard</a>
    <a href="#">Manage Courses</a>
    <a href="#">Manage Instructors</a>
    <a href="#">Manage Students</a>
</div>


<div class="container">
    <h1>Available Instructors</h1>
    <table>
        <thead>
        <tr>
            <th>Name</th>
            <th>Experience</th>
            <th>Email</th>
            <th>Courses</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="inst" items="${instructors}">
            <tr>
                <td>${inst.instructorName}</td>
                <td>${inst.instructorEXP}</td>
                <td>${inst.instructorEmail}</td>
                <td>
                    <table>
                        <thead>
                        <tr><th>Course Name</th><th>Course Duration</th><th></th></tr>
                        </thead>
                        <tbody>
                        <c:forEach var="course" items="${inst.courses}">
                            <tr>
                                <td>${course.courseName}</td>
                                <td>${course.courseDuration}</td>
                                <td><a href="${pageContext.request.contextPath}/courseOverview?courseId=${course.course_id}">View</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </td>
                <td><a class="green" href="${pageContext.request.contextPath}/addNewCourse">Add Course</a></td>
                <td><a class="blue" href="${pageContext.request.contextPath}/updateStudent?userID=${inst.id}">Edit</a></td>
                <td><a class="red" href="${pageContext.request.contextPath}/deleteInstructor?userID=${inst.id}" onclick="return confirm('Are you sure?')">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
