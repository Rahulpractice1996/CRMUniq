<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Sales User</title>
<link rel="stylesheet" type="text/css" href="views/css/main.css">
</head>
<body>
	<%@ include file="fragments/nav.jsp"%>
	<div class="showmanagercontainer">
		<h2>Add Sales User's to Manager ${managerName}'s Team</h2>
		<div class="search-bar">
			<form action="/searchManager" method="get" class="search-form">
				<input type="text" name="managerName" class="search-input"
					placeholder="Enter manager name" required>
				<button type="submit" class="search-button">Search</button>
			</form>
		</div>

		<div class="manager-details">
			<form action="/buildteam" method="post">
				<input type="hidden" name="managerId" value="${managerId}">
				<input type="hidden" name="managerName" value="${managerName}">

				<table>
					<thead>
						<tr>
							<th>Select</th>
							<th>SalesUser ID</th>
							<th>SalesUser Name</th>
							<th>Email</th>
							<th>Mobile</th>
							<th>Manager</th>
						</tr>
					</thead>
					<tbody>
						<!-- Repeat rows as needed with unassigned sales user details -->
						<c:forEach var="UnassignedSalesUser"
							items="${UnassignedSalesUsers}">
							<tr>
								<td><input type="checkbox" name="salesUserIds"
									value="${UnassignedSalesUser.EID}"></td>
								<td>${UnassignedSalesUser.EID}</td>
								<td>${UnassignedSalesUser.uname}</td>
								<td>${UnassignedSalesUser.email}</td>
								<td>${UnassignedSalesUser.contact}</td>
								<td>-</td>
								<!--
								<td class="action-links"><a
									href="/AddSalesUers?managerId=${manager.EID}">Assign Leads</a></td> -->
							</tr>
						</c:forEach>
						<!-- Repeat rows as needed with assigned sales user details -->
						<c:forEach var="assignedSalesUser" items="${assignedSalesUsers}">
							<tr>
								<td><input type="checkbox" name="salesUserIds"
									value="${assignedSalesUser.EID}"></td>
								<td>${assignedSalesUser.EID}</td>
								<td>${assignedSalesUser.uname}</td>
								<td>${assignedSalesUser.email}</td>
								<td>${assignedSalesUser.contact}</td>
								<td><c:forEach var="DAO" items="${DAO}">
										<c:if test="${DAO.salesUserID == assignedSalesUser.EID}">${DAO.managerName}</c:if>
									</c:forEach>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<button type="submit">Build Team</button>
			</form>
		</div>
	</div>
</body>
</html>
