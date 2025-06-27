<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
      background-color: #e9ecef;
      margin: 0;
      padding: 0;
    }

     
    .navbar {
      background-color: white;
      color: black;
      padding: 15px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

     
    .main-container {
      margin-top: 80px;
      padding: 20px;
      display: flex;
      justify-content: center;
    }

    .container {
      background: white;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
      max-width: 900px;
      width: 100%;
    }

     
    h1 {
      font-size: 26px;
      text-align: center;
      color: #0d6efd;
      font-weight: bold;
    }

     
    p {
      font-size: 16px;
      color: #555;
    }

     
    h2 {
      font-size: 22px;
      color: #333;
      text-decoration: underline;
    }

     
    .LessonDiv {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: #f8f9fa;
      padding: 12px;
      border-radius: 8px;
      margin: 8px 0;
      transition: all 0.3s;
    }

    .LessonDiv:hover {
      background: #dee2e6;
    }

    .LessonDiv a {
      text-decoration: none;
      font-size: 16px;
      font-weight: bold;
      color: #0d6efd;
    }

     
    .btn-warning {
      background-color: #ffc107;
      color: black;
      font-weight: bold;
    }

    .btn-warning:hover {
      background-color: #e0a800;
    }

    .editButton {
      background: #ffc107;
      border: none;
      padding: 6px 12px;
      font-size: 14px;
      border-radius: 5px;
      cursor: pointer;
      color: black;
    }

    .editButton:hover {
      background: #e0a800;
    }

    .deleteButton {
      background: #dc3545;
      border: none;
      padding: 6px 12px;
      font-size: 14px;
      border-radius: 5px;
      cursor: pointer;
      color: white;
    }

    .deleteButton:hover {
      background: #c82333;
    }

     
    .pagination {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }

    .pagination a {
      text-decoration: none;
      color: white;
      background: #0d6efd;
      padding: 8px 12px;
      border-radius: 5px;
      margin: 0 5px;
      font-size: 14px;
    }

    .pagination a:hover {
      background: #0b5ed7;
    }
    .course-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 20px;
    }

    .course-header h1 {
      flex-grow: 1;
      text-align: center;
      font-size: 26px;
      color: #0d6efd;
      font-weight: bold;
      margin: 0;
    }
  </style>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm fixed-top">
  <div class="container-fluid px-5">
    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/adminPage">LMS</a>

    <div class="collapse navbar-collapse justify-content-between">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/adminPage">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/addInstructorPage">Add Instructor</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/addNewCourse">Add Course</a>
        </li>
      </ul>

      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a href="${pageContext.request.contextPath}/logout" class="btn btn-primary">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="main-container">
  <div class="container" >
    <div class="course-header">
      <h1>${courseOverviewToLessonDTO.course.courseName}</h1>
      <button class="btn btn-warning btn-add-lesson" onclick="addLessonPage()">Add Lesson</button>
    </div>
    <hr>
    <p>${courseOverviewToLessonDTO.course.courseDescription}</p>
    <h2>Topics:</h2>

    <c:forEach var="lesson" items="${lessons.pageList}">
      <div class="LessonDiv">
        <div>
          <span>&#10148;</span>
          <a class="lesson-link" href="${pageContext.request.contextPath}/lessonPage?lessonID=${lesson.lesson_id}&courseName=${courseOverviewToLessonDTO.course.courseName}&courseListSize=${courseOverviewToLessonDTO.courseListSize}&firstNumber=${courseOverviewToLessonDTO.firstNumber}&courseId=${courseOverviewToLessonDTO.courseId}">
              ${lesson.lessonName}
          </a>
        </div>
        <div>
          <button class="editButton" onclick="editLessonPage(${lesson.lesson_id})">Edit</button>
          <button class="deleteButton" onclick="deleteLesson(${lesson.lesson_id})">Delete</button>
        </div>
      </div>
    </c:forEach>

    <!-- Pagination -->
    <div class="pagination">
      <c:choose>
        <c:when test="${!lessons.firstPage}">
          <a href="${pageContext.request.contextPath}/courseOverview?courseId=${courseId}&pageNumber=prev">Prev</a>
        </c:when>
      </c:choose>

      <c:forEach begin="0" end="${lessons.pageCount-1}" varStatus="loop">
        <c:if test="${lessons.pageCount-1 > 0 }">
          <a href="${pageContext.request.contextPath}/courseOverview?courseId=${courseId}&pageNumber=${loop.index}">
              ${loop.index+1}
          </a>
        </c:if>
      </c:forEach>

      <c:choose>
        <c:when test="${!lessons.lastPage}">
          <a href="${pageContext.request.contextPath}/courseOverview?courseId=${courseId}&pageNumber=next">Next</a>
        </c:when>
      </c:choose>
    </div>

  </div>
</div>

<script>
  function addLessonPage() {
    window.location.href = "${pageContext.request.contextPath}/addLesson?courseId=${courseId}"
  }

  function editLessonPage(lessonId) {
    window.location.href = "${pageContext.request.contextPath}/editLesson?courseId=${courseId}&lessonId=" + lessonId;
  }

  function deleteLesson(lessonId) {
    window.location.href = "${pageContext.request.contextPath}/deleteLesson?courseId=${courseId}&lessonId=" + lessonId;
  }
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
