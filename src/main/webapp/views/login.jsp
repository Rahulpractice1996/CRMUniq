<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    
        <link rel="stylesheet" type="text/css" href="views/css/loginstyle.css">
        
</head>
<body>
    <div class="login-container">
    
    <div class="error-message">
	<c:if test="${not empty error}"> <p class="error">${error}</p> </c:if>    
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
</body>
</html>
