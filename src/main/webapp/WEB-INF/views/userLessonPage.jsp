<%@ page import="Com.Sravan.Entity.Lesson" %>
<%@ taglib prefix="C" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Lesson Page</title>
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
     
    .button-container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 30px;
      width: 100%;
    }

    .btn {
      padding: 12px 20px;
      font-size: 16px;
      font-weight: bold;
      text-transform: uppercase;
      border-radius: 8px;
      text-decoration: none;
      text-align: center;
      transition: all 0.3s ease;
      width: 30%;
      text-align: center;
    }

    .btn-blue {
      background-color: #007bff;
      color: white;
      border: none;
    }

    .btn-blue:hover {
      background-color: #0056b3;
    }

    .btn-dark {
      background-color: #000000;
      color: white;
      border: none;
    }

    .btn-dark:hover {
      background-color: #333;
    }

     
    .hidden-btn {
      visibility: hidden;
      width: 30%;
    }

     
    .video-container {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }

    iframe {
      border-radius: 10px;
      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
    }

     
    .footer {
      background-color: #222;
      color: white;
      text-align: center;
      padding: 10px;
      margin-top: 30px;
      border-radius: 8px;
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

     
    @media (max-width: 768px) {
      .button-container {
        flex-direction: row;
        justify-content: space-around;
      }

      .btn, .hidden-btn {
        width: 30%;
      }
    }
  </style>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

<!-- Main Content -->
<div class="container">
  <h1 style=" text-align: center;
      font-size: 32px;
      color: #007bff;
      margin-bottom: 20px;
      font-weight: bold;
       font-family: 'Poppins', sans-serif" >${courseName}</h1>
  <hr>
  <h3>${lesson.lessonName}</h3>
  <p>${lesson.lessonText}</p>

  <!-- Video Section -->
  <div class="video-container">
    ${lesson.lessonLink}
  </div>

  <%
    Lesson lesson = (Lesson) request.getAttribute("lesson");
    int preLessonID = lesson.getLesson_id() - 1;
    int nextLessonId = lesson.getLesson_id() + 1;
    int courseListSize = (int) request.getAttribute("courseListSize");
    int firstNumber = (int) request.getAttribute("firstNumber");
    int size = firstNumber + courseListSize - 1;
    pageContext.setAttribute("sizeTo", size);
    pageContext.setAttribute("preLessonID", preLessonID);
    pageContext.setAttribute("nextLessonId", nextLessonId);
  %>

  <!-- Navigation Buttons -->
  <div class="button-container">
    <!-- Keep space for "Previous Video" even if it is not available -->
    <c:choose>
      <c:when test="${lesson.lesson_id > firstNumber}">
        <a href="${pageContext.request.contextPath}/userLessonPage?lessonID=${preLessonID}&courseName=${courseName}&courseListSize=${courseListSize}&firstNumber=${firstNumber}&courseId=${courseId}"
           class="btn btn-blue">Previous Video</a>
      </c:when>
      <c:otherwise>
        <span class="hidden-btn"></span>
      </c:otherwise>
    </c:choose>

    <!-- Center "Back to Course" Button -->
    <a href="${pageContext.request.contextPath}/userCourseOverview?courseId=${courseId}" class="btn btn-dark">
      Back to Course
    </a>

    <!-- Keep space for "Next Video" even if it is not available -->
    <c:choose>
      <c:when test="${lesson.lesson_id < sizeTo}">
        <a href="${pageContext.request.contextPath}/userLessonPage?lessonID=${nextLessonId}&courseName=${courseName}&courseListSize=${courseListSize}&firstNumber=${firstNumber}&courseId=${courseId}"
           class="btn btn-blue">Next Video</a>
      </c:when>
      <c:otherwise>
        <span class="hidden-btn"></span>
      </c:otherwise>
    </c:choose>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<!-- Footer -->
<div class="footer">
  &copy; 2025 LMS | All Rights Reserved
</div>

</body>
</html>
