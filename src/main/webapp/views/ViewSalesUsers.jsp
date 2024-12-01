<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Show Managers</title>
<link rel="stylesheet" type="text/css" href="views/css/main.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<!-- Google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<body>
	<%@ include file="fragments/nav.jsp"%>
	<div class="ViewSalesUserscontainer">
		<h2>Manager and Team</h2>
		<div class="manager-details">
			<table>
				<tr>
					<th>Manager Name</th>
					<th>Manager ID</th>
				</tr>
				<tr>
					<td>${manager.uname}</td>
					<td>${manager.EID}</td>
				</tr>
			</table>
			<table>
				<thead>
					<tr>
						<th>Sales User ID</th>
						<th>Sales User Name</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Assigned Leads</th>
					</tr>
				</thead>
				<tbody>
					<!-- Repeat rows as needed with manager details -->
					<c:forEach var="salesuser" items="${salesusers}">
						<tr>
							<td>${salesuser.EID}</td>
							<td>${salesuser.uname}</td>
							<td>${salesuser.email}</td>
							<td>${salesuser.contact}</td>
							<td><a href="/ViewTaskSalesUsers?SalesUserId=${salesuser.EID}">View Leads </a></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
