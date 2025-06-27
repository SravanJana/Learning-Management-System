<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Course Lessons</title>

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
      border-radius: 10px;
      box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
      padding: 20px;
      max-width: 90%;
      margin: auto;
    }

     
    h1 {
      text-align: center;
      font-size: 32px;
      color: #007bff;
      margin-bottom: 20px;
      font-weight: bold;
    }

    h2 {
      font-size: 24px;
      margin-top: 20px;
      text-decoration: underline;
    }

    p {
      font-size: 18px;
      color: #555;
      line-height: 1.6;
    }

     
    .lesson-item {
      display: flex;
      align-items: center;
      background-color: #f8f9fa;
      padding: 12px;
      border-radius: 8px;
      margin-bottom: 10px;
      transition: 0.3s;
      border: 1px solid #ddd;
      text-align: left;   
    }

    .lesson-item:hover {
      background-color: #e9ecef;
    }

    .lesson-link {
      text-decoration: none;
      font-size: 18px;
      color: #007bff;
      font-weight: 500;
      margin-left: 10px;   
    }

    .lesson-link:hover {
      text-decoration: underline;
      color: #0056b3;
    }

     
    .btn-green {
      background-color: #28a745;
      color: white;
      padding: 8px 12px;
      font-size: 14px;
      border-radius: 8px;
      text-decoration: none;
      display: inline-block;
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
    }

    .btn-blue:hover {
      background-color: #0056b3;
    }

     
    .pagination {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }

    .pagination a {
      padding: 8px 12px;
      margin: 5px;
      border-radius: 5px;
      background-color: #007bff;
      color: white;
      text-decoration: none;
      font-size: 14px;
    }

    .pagination a:hover {
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
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/userPageNext">LMS</a>
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

<!-- Page Content -->
<div class="container">
  <h1>${courseOverviewToLessonDTO.course.courseName}</h1>
  <hr>
  <p>${courseOverviewToLessonDTO.course.courseDescription}</p>

  <h2>Topics:</h2>
  <c:forEach var="lesson" items="${lessons.pageList}">
    <div class="lesson-item">
      <span>&#10148;</span>
      <a class="lesson-link" href="${pageContext.request.contextPath}/userLessonPage?lessonID=${lesson.lesson_id}&courseName=${courseOverviewToLessonDTO.course.courseName}&courseListSize=${courseOverviewToLessonDTO.courseListSize}&firstNumber=${courseOverviewToLessonDTO.firstNumber}&courseId=${courseOverviewToLessonDTO.courseId}">
          ${lesson.lessonName}
      </a>
    </div>
  </c:forEach>

  <!-- Pagination -->
  <div class="pagination">
    <c:choose>
      <c:when test="${!lessons.firstPage}">
        <a href="${pageContext.request.contextPath}/userCourseOverview?courseId=${courseId}&pageNumber=prev">Prev</a>
      </c:when>
    </c:choose>

    <c:forEach begin="0" end="${lessons.pageCount-1}" varStatus="loop">
      <c:if test="${lessons.pageCount-1 > 0}">
        <a href="${pageContext.request.contextPath}/userCourseOverview?courseId=${courseId}&pageNumber=${loop.index}">${loop.index+1}</a>
      </c:if>
    </c:forEach>

    <c:choose>
      <c:when test="${!lessons.lastPage}">
        <a href="${pageContext.request.contextPath}/userCourseOverview?courseId=${courseId}&pageNumber=next">Next</a>
      </c:when>
    </c:choose>
  </div>
</div>

<!-- Footer -->
<footer class="footer">
  <p>&copy; 2025 LMS | All Rights Reserved</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
