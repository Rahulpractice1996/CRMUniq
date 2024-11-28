<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Homepage</title>
    <link rel="stylesheet" href="views/css/main.css">
 
</head>
<body>
<%@ include file="fragments/nav.jsp" %>
   
    <main>
    <h1>Mr. ${users.uname}</h1>
        <h1>Welcome to the Admin Homepage</h1>
        <p>This is the main dashboard for admins. Customize it with relevant information and widgets.</p>
    </main>

 <%@ include file="fragments/footer.jsp" %>>
 </body>
</html>
