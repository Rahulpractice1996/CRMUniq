<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Human Resource</title>
    <link rel="stylesheet" type="text/css" href="views/css/main.css">
</head>
<body>
<%@ include file="fragments/nav.jsp" %>

    <div class="container">
    
    
    
        <h2>Add Human Resource</h2>
        <c:if test="${not empty message}">
   			 <p class="message">${message}</p>
   		</c:if>   
        <form action="/addHumanResource" method="post">
            <div class="form-group">
                <label for="role">Role:</label>
                <select id="role" name="role" required>
                    <option value="Admin">Admin</option>
                    <option value="Manager">Manager</option>
                    <option value="SalesUser">Sales User</option>
                </select>
            </div>
            <div class="form-group">
                <label for="uname">Username:</label>
                <input type="text" id="uname" name="uname" required>
            </div>
            <div class="form-group">
                <label for="pwd">Password:</label>
                <input type="password" id="pwd" name="pwd" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="contact_no">Mobile:</label>
                <input type="text" id="contact_no" name="contact" required>
            </div>
            <div class="form-group">
                <button type="submit">Register</button> 
            </div>
        </form>
    </div>
     <%@ include file="fragments/footer.jsp" %>>
    
</body>
</html>
