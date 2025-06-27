<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8d7da;
        }
        .error-container {
            text-align: center;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            background-color: white;
            width: 50%;
        }
        .error-icon {
            font-size: 50px;
            color: #dc3545;
        }
    </style>
</head>
<body>

<div class="error-container">
    <div class="error-icon">❌</div>
    <h2 class="text-danger">Oops! Something went wrong.</h2>
    <p>${errorMessage}</p>
    <a href="${pageContext.request.contextPath}/adminPage" class="btn btn-primary">Go Back Home</a>
</div>

</body>
</html>
