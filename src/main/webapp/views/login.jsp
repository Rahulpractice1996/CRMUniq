<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    
    <!-- External CSS -->
    <link rel="stylesheet" type="text/css" href="views/css/loginstyle.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Google Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
    <!-- Header -->
    <div class="navbar">
    <a href="/login" class="logo d-flex align-items-center">
        <!-- CRM Application Icon -->
        <i class="material-icons me-2">business</i>
        CRM Application
    </a>
    </div>

    <!-- Main Content (2-Card Layout) -->
    <main>
        <!-- Card for Login Form -->
        <div class="card login-card">
            <!-- Error Message -->
            <div class="error-message">
                <c:if test="${not empty error}">
                    <p class="error">${error}</p>
                </c:if>
            </div>

            <h2>Login</h2>
            <form action="/login" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <button type="submit">Login</button>
                </div>
            </form>
        </div>

        <!-- Card for Image -->
        <div class="card image-card">
            <img src="views/css/crm-image.webp" alt="CRM Example Image" class="img-fluid">
        </div>
    </main>

</body>
</html>
