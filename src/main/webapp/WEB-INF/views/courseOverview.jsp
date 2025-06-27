<%@ taglib prefix="C" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: SRAVAN
  Date: 01-02-2025
  Time: 03:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List</title>
    <style>
         
        body {
            font-family: Arial, sans-serif;
            background-color: #d3d3d3;
            padding: 20px;
        }

         
        .container {
            background: white;
            padding: 20px;
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

         
        .blue {
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

        .blue:hover {
            background-color: #45a049;
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

        .courseNameHeader {
            display: flex;
            justify-content: space-between;
            align-items: center;

        }

        .LessonDiv {
            display: flex;
            align-items: center;  
            gap: 10px;  
            margin-bottom: 5px;
            justify-content: space-between;
        }

        .editButton {
            padding: 5px 10px;
            font-size: 12px;
            cursor: pointer;
            border-radius: 10px;
            border: none;

            background-color: #b89e3a;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
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
<script>
    function addLessonPage() {
        window.location.href = "${pageContext.request.contextPath}/addLesson?courseId=${courseId}"
    }
    function editLessonPage(lessonId) {

        window.location.href= "${pageContext.request.contextPath}/editLesson?courseId=${courseId}&lessonId="+lessonId
    }
</script>

    <div class="container">
        <div class="courseNameHeader">
            <h1 style="text-align: center;flex: 1">${courseOverviewToLessonDTO.course.courseName}</h1>
            <button style="text-align: end"  class="btn btn-warning" onclick="addLessonPage()">Add Lesson</button>
        </div>
        <hr class="rounded bg-dark">
        <p style="font-size: large">${courseOverviewToLessonDTO.course.courseDescription}</p>
        <h2><u>Topics:</u></h2>
        <c:forEach var="lesson" items="${lessons.pageList}">

            <div class="LessonDiv">
                <div>

                    <a href="${pageContext.request.contextPath}/lessonPage?lessonID=${lesson.lesson_id}&courseName=${courseOverviewToLessonDTO.course.courseName}&courseListSize=${courseOverviewToLessonDTO.courseListSize}&firstNumber=${courseOverviewToLessonDTO.firstNumber}&courseId=${courseOverviewToLessonDTO.courseId}">${lesson.lessonName}</a>
                </div>

                <div>

                    <button class="editButton" onclick= "editLessonPage(${lesson.lesson_id})"  >Edit</button>
                </div>



            </div>


        </c:forEach>
        <br>

        <c:choose>


            <c:when test="${lessons.firstPage}">
            </c:when>
            <c:otherwise>
                    <a href="${pageContext.request.contextPath}/courseOverview?courseId=${courseId}&pageNumber=prev">Prev</a>
            </c:otherwise>

        </c:choose>


        <c:forEach begin="0" end="${lessons.pageCount-1}" varStatus="loop">
            <c:if test="${lessons.pageCount-1 > 0 }">
                <a href="${pageContext.request.contextPath}/courseOverview?courseId=${courseId}&pageNumber=${loop.index}">&nbsp;${loop.index+1}&nbsp;</a>
            </c:if>
        </c:forEach>

        <c:choose>
            <c:when test="${lessons.lastPage}">
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/courseOverview?courseId=${courseId}&pageNumber=next">Next</a>
            </c:otherwise>

        </c:choose>

    </div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
