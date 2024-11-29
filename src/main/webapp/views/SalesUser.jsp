<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sales Users</title>
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
	<div class="Salescontainer">
		<h2>Show Sales Users</h2>
		<div class="search-bar">
			<form action="/searchManager" method="get">
				<input type="text" name="managerName"
					placeholder="Enter manager name" required>
				<button type="submit">Search</button>
			</form>
		</div>
		<div class="SalesUser-details">
			<table>
				<thead>
					<tr>
						<th>SalesUser ID</th>
						<th>SalesUser Name</th>
						<th>Email</th>
						<th>Mobile</th>
						<th>Manager</th>
						<th>Actions</th>

					</tr>
				</thead>
				<tbody>
					<!-- Repeat rows as needed with manager details -->
					<c:forEach var="SalesUser" items="${SalesUsersUnasigned}">
						<tr>
							<td>${SalesUser.EID}</td>
							<td>${SalesUser.uname}</td>
							<td>${SalesUser.email}</td>
							<td>${SalesUser.contact}</td>
							<td>
								<form action="/allocate" method="post">
									<input type="hidden" name="SuID" value="${SalesUser.EID}" /> <select
										id="listSelect" name="MID">
										<option value="#">-Select Manager-</option>

										<c:forEach var="manager" items="${allmanagers}">
											<option value="${manager.EID}">${manager.uname}</option>
										</c:forEach>
									</select> <input type="submit" value="Allocate">
								</form>
							</td>
							<td class="action-links"><a
								href="/ViewTaskSalesUsers?SalesUserId=${SalesUser.EID}">Task
									View Leads </a></td>


						</tr>
					</c:forEach>
					<c:forEach var="SalesUser" items="${SalesUsersAsigned}">
						<tr>
							<td>${SalesUser.EID}</td>
							<td>${SalesUser.uname}</td>
							<td>${SalesUser.email}</td>
							<td>${SalesUser.contact}</td>
							<td><c:forEach var="DAO" items="${DAO}">
									<c:if test="${DAO.salesUserID == SalesUser.EID}">

										<a
											href="/ViewSalesUsers?managerId=${DAO.managerID}&managerName=${DAO.managerName}">
											${DAO.managerName} </a>
									</c:if>
								</c:forEach></td>


							<td class="action-links"><a
								href="/ViewTaskSalesUsers?SalesUserId=${SalesUser.EID}">Task
									View Leads </a></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
