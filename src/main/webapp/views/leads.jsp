<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Leads View</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&display=swap" />
    <link rel="stylesheet" href="views/css/main.css">

</head>
<body>
<%@ include file="fragments/nav.jsp" %>
    <div class="Leadcontainer">
        <h2>Leads</h2>
        <form action="/AllocateLeads" method="POST">
        <p>Allocate leads to either Manager or salesuser<p>
            <div class="form-group-dropdown">
                <label for="managerSelect">Select Manager:</label>
                <select id="managerSelect" name="managerId">
                        <option value="-1">-select-</option>
                    <c:forEach var="manager" items="${Managers}">
                        <option value="${manager.EID}">${manager.uname}</option>
                    </c:forEach>
                </select>
                
                <label for="salesUserSelect">Select Sales User:</label>
                <select id="salesUserSelect" name="salesUserId">
                		<option value="-1">-select-</option>
                    <c:forEach var="salesUser" items="${SalesUsers}">
                        <option value="${salesUser.EID}">${salesUser.uname}</option>
                    </c:forEach>
                </select>
                <button type="submit">Allocate</button>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Select</th>
                        <th>Lead Name</th>
                        <th>Actions</th>
                        <th>Lead Begin on</th>
                        <th>Lead Stage</th>
                        <th>Lead Owner</th>
                        <th>Modified On</th>
                        <th>Looking For</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="lead" items="${leads}">
                        <tr>
                            <td><input type="checkbox" name="LeadID" value="${lead.LID}"></td>
                            <td>${lead.leadName}</td>
                            <td class="actions">
                                <span class="material-symbols-outlined" title="Call">call</span>
                                <span class="material-symbols-outlined" title="Email">email</span>
                                <span class="material-symbols-outlined" title="SMS">sms</span>
                            </td>
                            <td>${lead.beginDate}</td>
                            <td>${lead.leadStatus}</td>
                            <td>${lead.leadOwner}</td>
                            <td>${lead.endDate}</td>
                            <td>${lead.lookingFor}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form>
    </div>
</body>
</html>
