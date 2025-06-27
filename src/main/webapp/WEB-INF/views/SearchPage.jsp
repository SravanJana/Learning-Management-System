<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <title>Instructor List</title>

    <!-- Bootstrap & Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
         
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }

        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
            max-width: 1100px;
            margin: auto;
        }

        h1 {
            text-align: center;
            font-size: 32px;
            color: #007bff;
            margin-bottom: 20px;
            font-weight: bold;
        }

         
        .table-container {
            overflow-x: auto;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        th {
            background-color: #007bff;
            color: white;
            padding: 12px;
            text-align: center;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0e0e0;
        }

         
        .course-table {
            width: 100%;
            margin-top: 10px;
        }

        .course-table th {
            background-color: #28a745;
        }

         
        .btn-custom {
            padding: 8px 12px;
            font-size: 14px;
            border-radius: 8px;
            text-decoration: none;
            display: inline-block;
            color: white;
            text-align: center;
            transition: 0.3s;
        }

        .btn-green { background-color: #28a745; }
        .btn-green:hover { background-color: #218838; }

        .btn-blue { background-color: #007bff; }
        .btn-blue:hover { background-color: #0056b3; }

        .btn-red { background-color: #dc3545; }
        .btn-red:hover { background-color: #c82333; }

         
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
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/instructor" style="font-size: 24px">LMS</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="${pageContext.request.contextPath}/instructor">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/addInstructorPage">Add Instructor</a>
                </li>
            </ul>

            <!-- Search Form -->
            <form:form action="searchInstructor" class="d-flex" modelAttribute="searchClass">
                <form:input class="form-control me-2" type="search" placeholder="Search for instructor" path="name"/>
                <button class="btn btn-outline-primary" type="submit">Search</button>
            </form:form>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">
    <h1>Search Results for "${searchedName}"</h1>

    <div class="table-container">
        <table>
            <thead>
            <tr>
                <th>Name</th>
                <th>Experience</th>
                <th>Email</th>
                <th>Courses</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="inst" items="${instructors}">
                <tr>
                    <td>${inst.instructorName}</td>
                    <td>${inst.instructorEXP} years</td>
                    <td>${inst.instructorEmail}</td>
                    <td>
                        <table class="course-table">
                            <thead>
                            <tr>
                                <th>Course Name</th>
                                <th>Duration</th>
                                <th>View</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="course" items="${inst.courses}">
                                <tr>
                                    <td>${course.courseName}</td>
                                    <td>${course.courseDuration} months</td>
                                    <td>
                                        <a class="btn btn-sm btn-outline-success" href="${pageContext.request.contextPath}/courseOverview?courseId=${course.course_id}">
                                            View
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </td>
                    <td>
                        <a class="btn-custom btn-green" href="${pageContext.request.contextPath}/addNewCourse">Add Course</a>
                        <a class="btn-custom btn-blue" href="${pageContext.request.contextPath}/updateStudent?userID=${inst.id}">Edit</a>
                        <a class="btn-custom btn-red" href="${pageContext.request.contextPath}/deleteInstructor?userID=${inst.id}"
                           onclick="return confirm('Are you sure you want to delete this instructor?');">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <p>&copy; 2025 LMS | All Rights Reserved</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
