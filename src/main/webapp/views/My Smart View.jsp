<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Leads View</title>
<link rel="stylesheet" href="views/css/main.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&display=swap" />
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<%@ include file="fragments/nav.jsp"%>
	<div class="Leadcontainer">
		<h2>All Leads for ${user}</h2>
		<table>
			<thead>
				<tr>
					<th>Lead Name</th>
					<th>Lead Begin on</th>
					<th>Lead Stage</th>
					<th>Lead Owner</th>
					<th>Modified On</th>
					<th>Looking For</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="lead" items="${leads}">
					<c:if test="${lead.leadStatus != 'Received'}">
						<tr>
							<td><a href="/LeadDetails?LID=${lead.LID}">${lead.leadName}</a></td>
							<td>${lead.beginDate}</td>
							<td>${lead.leadStatus}</td>
							<td>${lead.leadOwner}- ${lead.leadOwnerRole}</td>
							<td>${lead.endDate}</td>
							<td>${lead.lookingFor}</td>
						</tr>
					</c:if>
				</c:forEach>

			</tbody>
		</table>
		</form>
	</div>
	
	
</body>
</html>
