<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Managers</title>
    <link rel="stylesheet" type="text/css" href="views/css/main.css">
    <!-- Bootstrap CSS -->
<!--     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"> -->
    <!-- Google Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<%@ include file="fragments/nav.jsp" %>
    <div class="showmanagercontainer">
        <h2>All Managers</h2>
        <div class="manager-details">
            <table>
                <thead>
                    <tr>
                        <th>Manager ID</th>
                        <th>Manager Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Actions</th>
                        <th>Team Status</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Repeat rows as needed with manager details -->
                    <c:forEach var="manager" items="${managers}">
                        <tr>
                            <td>${manager.EID}</td>
                            <td>${manager.uname}</td>
                            <td>${manager.email}</td>
                            <td>${manager.contact}</td>
                            <td class="action-links">
                                <a href="/ViewSalesUsers?managerId=${manager.EID}&managerName=${manager.uname}"><i class="icon material-icons">visibility</i> Team Details</a>
                                <a href="/AddSalesUsers?managerId=${manager.EID}&managerName=${manager.uname}"><i class="icon material-icons">person_add</i> Sales Users</a>
                            </td>
                            <td>Team Not Allotted</td>
                        </tr>
                    </c:forEach>
                    <c:forEach var="manager" items="${assignedManagers}">
                        <tr>
                            <td>${manager.EID}</td>
                            <td>${manager.uname}</td>
                            <td>${manager.email}</td>
                            <td>${manager.contact}</td>
                            <td class="action-links">
                                <a href="/ViewSalesUsers?managerId=${manager.EID}&managerName=${manager.uname}"><i class="icon material-icons">visibility</i> Team Details</a>
                                <a href="/AddSalesUsers?managerId=${manager.EID}&managerName=${manager.uname}"><i class="icon material-icons">person_add</i> Sales Users</a>
                            </td>
                            <td>Team Allotted</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
