<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: SRAVAN
  Date: 02-03-2025
  Time: 19:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - LMS</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .navbar {
            background-color: white;
            color: #000000;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar h1 {
            margin: 0;
        }
        .sidebar {
            width: 200px;
            height: 100vh;
            position: fixed;
            background-color: #333;
            color: white;
            padding-top: 20px;
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
        .main-content {
            margin-left: 220px;
            padding: 20px;
        }
        .card {
            background: white;
            padding: 20px;
            margin: 20px 0;
            box-shadow: 2px 2px 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        .stats {
            display: flex;
            justify-content: space-around;
        }
        .stat-box {
            background: #007BFF;
            color: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            width: 30%;
        }
        .stat-box h3 {
            margin: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background: #007BFF;
            color: white;
        }
        .main-div {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items:flex-start;
            font-family: 'Arial', sans-serif;
            background-color: #f3f4f6;  
        }
         
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        .form-container form label {
            font-size: 14px;
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .form-container form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        .form-container form button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container form button:hover {
            background-color: #0056b3;
        }

         
        h1 {
            text-align: center;
            font-size: 28px;
            color: #333;
        }

         
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            border-radius: 10px;
            cursor: pointer;
            display: block;
            margin: 10px auto;
        }

        button:hover {
            background-color: #45a049;
        }

         
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

         
        th {
            background-color: #222;
            color: white;
            padding: 12px;
            text-align: left;
        }

         
        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

         
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

         
        tr:hover {
            background-color: #ddd;
        }
         
         
         
         
         
         
        .error {
            color: red;  
            font-size: 15px;  
            font-style: italic;  
            margin-bottom: 2px;  
             
            text-align: left;
            position: fixed;
            margin-left: 270px;
        }

        label {
            font-weight: bold;  
            display: block;  
            margin-bottom: 5px;  
        }

        input,
        select {
            margin-bottom: 15px;  
            width: 100%;  
            padding: 8px;  
            border: 1px solid #ccc;  
            border-radius: 5px;  
        }

        input[type="submit"] {
            background-color: #007bff;  
            color: white;  
            border: none;  
            padding: 10px 20px;  
            border-radius: 5px;  
            cursor: pointer;  
        }

        input[type="submit"]:hover {
            background-color: #0056b3;  
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm ">
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
<div class="main-div">
    <div class="form-container">
        <h1>Add Lesson</h1>
        <form:form action="processAddLessonPage?courseId=${course.course_id}" modelAttribute="lesson"  method="post">
            <form:errors path="lessonName" cssClass="error"/>
            <label>Lesson Name:</label>
            <form:input path="lessonName"/><br>
            <form:errors path="lessonLink" cssClass="error"/>
            <label>Lesson Link:</label>
            <form:input path="lessonLink"/><br>
            <form:errors path="lessonText" cssClass="error"/>
            <label>Lesson Text:</label>
            <form:input path="lessonText"/><br>
            <label>Course Name :</label>
            <form:input path="course.courseName" disabled="true"/><br>

            <br>
            <br>
            <input style="text-align: center" type="submit" value="Add">
        </form:form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
