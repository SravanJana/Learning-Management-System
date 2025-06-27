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
      margin: 0;
      padding: 10px;
    }

     
    .container {
      background: white;
      border-radius: 10px;
      box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
      max-width: 800px;
      margin: auto;
    }

     
    h1 {
      text-align: center;
      font-size: 28px;
      color: #333;
    }
    .footer {
      background-color: black;
      color: white;
      text-align: center;
      padding: 10px;
      width: 100%;
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
    .green {
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

    .green:hover {
      background-color: #45a049;
    }
    .blue {
      background-color: #345be3;
      color: white;
      border: none;
      padding: 10px 15px;
      font-size: 16px;
      border-radius: 10px;
      cursor: pointer;
      display: block;
      margin: 10px auto;
    }

    .blue:hover {
      background-color: #2672b8;
    }
    .red {
      background-color: #f40909;
      color: white;
      border: none;
      padding: 10px 15px;
      font-size: 16px;
      border-radius: 10px;
      cursor: pointer;
      display: block;
      margin: 10px auto;
    }

    .red:hover {
      background-color: #f40909;
    }

  </style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
  <div class="container-fluid px-5">

    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/userPageNext" style="font-family: Roboto,serif;font-size: 24px">LMS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
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
        <form:form  action="UserSearchInstructor" class="d-flex me-2" modelAttribute="searchClass">
          <form:input cssStyle="margin-top: 15px" class="form-control form-control-sm me-2" type="search" placeholder="Search for instructor" path="name"/>
          <button class="btn btn-outline-primary me-2"  style="margin-top: 15px" type="submit">Search</button>
        </form:form>

        <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-primary me-2">Logout</a>
      </div>
    </div>
  </div>
</nav>

<div class="container">
  <h1 >Search for "${searchedName}" </h1>
  <%--        <form action="${pageContext.request.contextPath}/addInstructorPage">--%>
  <%--            <input type ="submit" value="Add">--%>
  <%--        </form>--%>
  <%--        <button onclick="window.location.href='addInstructorPage'">Add</button>--%>
  <%--    <table>--%>
  <%--        <thead  >--%>
  <%--        <tr>--%>
  <%--            <th>Name</th>--%>
  <%--            <th>Experience</th>--%>
  <%--            <th>Email</th>--%>
  <%--        </tr>--%>
  <%--        </thead>--%>

  <%--        <tbody  >--%>

  <%--        <c:forEach var="inst" items="${instructors}">--%>

  <%--            <tr>--%>
  <%--                <td>${inst.instructorName}</td>--%>
  <%--                <td>${inst.instructorEXP}</td>--%>
  <%--                <td>${inst.instructorEmail}</td>--%>
  <%--            </tr>--%>
  <%--        </c:forEach>--%>

  <%--        </tbody>--%>
  <%--    </table>--%>
  <table>
    <thead  >
    <tr>
      <th>Name</th>
      <th>Experience</th>
      <th>Email</th>
      <th>Courses</th>


    </tr>
    </thead>

    <tbody  >

    <c:forEach var="inst" items="${instructors}">

      <tr>
        <td>${inst.instructorName}</td>
        <td>${inst.instructorEXP}</td>
        <td>${inst.instructorEmail}</td>
        <td>
          <table>
            <thead>
            <tr>
              <th>Course Name</th>
              <th>Course duration</th>
              <th>View</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="course" items="${inst.courses}">
              <tr>
                <td>${course.courseName}</td>
                <td>${course.courseDuration}</td>
                <td> <a href="${pageContext.request.contextPath}/userCourseOverview?courseId=${course.course_id}">View</a></td>
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


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
