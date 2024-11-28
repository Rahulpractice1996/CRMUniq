<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Show Managers</title>
    <link rel="stylesheet" type="text/css" href="views/css/main.css">
</head>
<body>
<%@ include file="fragments/nav.jsp" %>
    <div class="showmanagercontainer">
        <h2>Show Managers</h2>
        <div class="search-bar">
            <form action="/searchManager" method="get">
                <input type="text" name="managerName" placeholder="Enter manager name" required>
                <button type="submit">Search</button>
            </form>
        </div>
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
                                <a href="/ViewSalesUsers?managerId=${manager.EID}&managerName=${manager.uname}">View Sales Users Details</a>
                                <a href="/AddSalesUsers?managerId=${manager.EID}&managerName=${manager.uname}">Add Sales Users</a>
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
                                <a href="/ViewSalesUsers?managerId=${manager.EID}&managerName=${manager.uname}">View Sales Users Details</a>
                                <a href="/AddSalesUsers?managerId=${manager.EID}&managerName=${manager.uname}">Add Sales Users</a>
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
