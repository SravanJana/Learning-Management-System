<%--
  Created by IntelliJ IDEA.
  User: SRAVAN
  Date: 29-01-2025
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #d3d3d3;
            padding: 20px;
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

    </style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/instructor">LMS </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/instructor">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/addInstructorPage">Add Instructor</a>
                </li>

            </ul>
            <form:form action="searchInstructor" class="d-flex" role="search" modelAttribute="searchClass">
                <form:input class="form-control me-2" type="search" placeholder="Search for instructor" aria-label="Search" path="name"/>
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form:form>
        </div>
    </div>
</nav>

<div class="main-div">
    <div class="form-container">
        <h1>update Instructor</h1>
        <form:form action="processUpdateInstructor?userID=${userID}"  modelAttribute="instructor" method="post">
            <label>Name:</label>
            <form:input path="instructorName"/><br>
            <form:errors path="instructorName" cssClass="error"/>
            <label>Experience:</label>
            <form:input path="instructorEXP"/><br>
            <form:errors path="instructorEXP" cssClass="error"/>
            <label>Email:</label>
            <form:input path="instructorEmail"/><br>
            <form:errors path="instructorEmail" cssClass="error"/>
            <br>

            <input style="text-align: center" type="submit" value="Add">
        </form:form>
    </div>
</div>



</body>
</html>
