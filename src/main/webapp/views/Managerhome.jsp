<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manager Home</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="views/css/main.css">
</head>
<body>
    <%@ include file="fragments/nav.jsp" %>

    <div class="container-fluid">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Manager Home</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/AllLeadsManagerMysmartView">Team Leads</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/mysmartView">My Task View</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="/leadsBucket">Leads bucket</a>
                    </li>
                    <li class="nav-item">
           <a class="nav-link" href="/ViewSalesUsers?managerId=${manager.EID}&managerName=${manager.uname}">My Team</a>
                        
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Page Content -->
        <div class="container mt-4">
            <h1>Welcome to Manager Home</h1>
            <p>Use the navigation bar to switch between Smart View, My Task View, and My Team.</p>
        </div>
    </div>

    <!-- Bootstrap and JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
