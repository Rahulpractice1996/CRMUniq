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
</head>
<body>
<%@ include file="fragments/nav.jsp" %>
	<div class="ViewSalesUserscontainer">
		<h2>My Sales Users</h2>
		<div class="search-bar">
			<form action="/searchManager" method="get">
				<input type="text" name="managerName"
					placeholder="Enter manager name" required>
				<button type="submit">Search</button>
			</form>
		</div>
		<div class="manager-details">
			<table>
				<tr>
					<th>Manager ID</th>
					<th>Manager Name</th>
				</tr>
				<tr>
				<td>${manager.EID}</td>
				<td>${manager.uname}</td>
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

						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
