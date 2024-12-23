<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Lead Details</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Google Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Custom CSS -->
<link rel="stylesheet" href="views/css/main.css">

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
}

.main-container {
	padding: 20px;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.left-section {
	flex: 1 1 35%;
	max-width: 35%;
}

.right-section {
	flex: 1 1 63%;
	max-width: 63%;
}

.header-section, .lead-properties, .activity-history, .right-section-nav
	{
	background-color: #fff;
	padding: 25px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin-bottom: 10px;
}

.lead-name {
	font-size: 1.6rem;
	font-weight: bold;
	margin-bottom: 5px;
}

.status-badge {
	background-color: #6c63ff;
	color: #fff;
	padding: 6px 12px;
	border-radius: 20px;
	font-size: 0.9rem;
	font-weight: 500;
}

.btn-icon {
	background: none;
	border: none;
	color: #6c63ff;
	font-size: 1.2rem;
	cursor: pointer;
	margin-left: 10px;
}

.btn-icon:hover {
	color: #4944e0;
}

.activity-filter {
	width: 150px;
	font-size: 0.9rem;
	padding: 5px 8px;
	border-radius: 4px;
	border: 1px solid #ddd;
}

.activity-item {
	display: flex;
	align-items: center;
	padding: 10px 0;
	border-bottom: 1px solid #ddd;
}

.activity-item:last-child {
	border-bottom: none;
}

.icon {
	color: #6c63ff;
	margin-right: 0px;
	font-size: 1.5rem;
}

.activity-item p {
	margin: 0;
	font-size: 0.95rem;
}

.timestamp {
	color: gray;
	font-size: 0.85rem;
	display: block;
	margin-top: 5px;
}

.right-section .nav-tabs .nav-link .nav-item {
	background-color: #fff;
	color: #000;
	border-radius: 4px;
	padding: 10px 10px;
	margin-right: 10px;
	transition: background-color 0.3s, color 0.3s;
}

.right-section .nav-tabs .nav-link:hover {
	background-color: #80bfff; /* Lighter blue */
	color: #fff;
}

.right-section .nav-tabs .nav-link.active {
	background-color: #007bff;
	color: #fff;
}

/* Modal styling */
.modal-content {
	border-radius: 8px;
}

/* Dropdown and Change Status Button Styling */
.status-dropdown {
	display: inline-block;
	align-items: center;
}

.status-select {
	font-size: 0.9rem;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-radius: 20px;
	margin-left: 15px;
	/* width: auto; */ /* Adjust to match the badge size */
	/* height: auto; */
}

/* Show the dropdown and button when an option is selected */
.status-select:focus+.change-status-btn {
	display: inline-block;
}

/* Style for dropdown and change status button when active */
.status-select:focus {
	background-color: #f9f9f9;
	border-color: #007bff;
}

/* Hover effect for dropdown */
.status-select:hover {
	border-color: #007bff;
}

/* Hover effect for the "Change Status" button */
.change-status-btn:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<%@ include file="fragments/nav.jsp"%>

	<div class="container-fluid main-container">
		<!-- Left Section -->
		<div class="left-section">
			<!-- Header Section -->
			<div class="header-section">
				<h4 class="lead-name">${lead.leadName}
					<!-- Action Buttons (Star, Edit) -->
					<button class="btn btn-icon">
						<i class="material-icons">star</i>
					</button>
					<!-- Edit button triggers the modal -->
					<button class="btn btn-icon" data-toggle="modal"
						data-target="#addLeadModal">
						<i class="material-icons">edit</i>
					</button>
				</h4>
				<p class="lead-location text-muted">${lead.preferedLocation},
					Tamil Nadu, India</p>
				<!-- Display current status as a badge -->
				<span class="status-badge">${lead.leadStatus}</span>
				<!-- Status Badge and Dropdown Box -->
				<div class="status-dropdown">
    <!-- Dropdown menu for selecting a new status -->
    <form action="/ChangeStatus" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="LID" value="${lead.LID}">
        <select id="statusSelect" class="status-select" name="status" required>
            <option value="">--Select--</option>
            <option value="in-progress">in-progress</option>
            <option value="ready-to-join">ready-to-join</option>
            <option value="Enrolled">Enrolled</option>
            <option value="rejected">Rejected</option>
        </select>
        <!-- Change Status Button -->
        <input type="submit" class="changeStatus" value="Change Status">
    </form>
</div>

<script>
    function validateForm() {
        var statusSelect = document.getElementById("statusSelect");
        if (statusSelect.value === "") {
            return false;
        }
        return true;
    }
</script>
				


			</div>

			<!-- Lead Properties Section -->
			<div class="lead-properties">
				<h5>
					<b>Lead Properties</b>
				</h5>
				<p>
					<strong>Owner:</strong> ${lead.leadOwner}
				</p>
				<p>
					<strong>Lead Created on:</strong> ${lead.beginDate}
				</p>
				<p>
					<strong>Last Modified on:</strong> ${lead.endDate}
				</p>
				<p>
					<strong>Enquired About:</strong> ${lead.lookingFor}
				</p>
				<p>
					<strong>Remarks:</strong> ${lead.notes}
				</p>
				<p>
					<strong>Lead Age:</strong> ${lead.leadAge}
				</p>
				<p>
					<strong>leadSource:</strong> ${lead.leadSource}
				</p>
			</div>
		</div>

		<!-- Right Section -->
		<div class="right-section">
			<!-- Tabs Section -->
			<div class="right-section-nav">
				<div class="row mt-3">
					<div class="col-md-12">
						<h5>Make Activity Via</h5>
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link" href="#"
								data-toggle="modal" data-target="#emailModal"><i
									class="icon material-icons">email</i></a></li>
							<li class="nav-item"><a class="nav-link" href="#"
								data-toggle="modal" data-target="#phoneModal"><i
									class="icon material-icons">phone</i></a></li>
							<li class="nav-item"><a class="nav-link" href="#"
								data-toggle="modal" data-target="#smsModal"><i
									class="icon material-icons">sms</i></a></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- Activity History Section -->
			<div class="activity-history">
				<div class="timeline">
					<c:forEach var="transaction" items="${lead.transactions}">
						<div class="activity-item">
							<i class="icon material-icons">${transaction.contactType}</i>
							<div>
								<p>${transaction.remarks}</p>
								<span class="timestamp">${transaction.dateTimeStamp}</span>
							</div>
						</div>
					</c:forEach>


				</div>
			</div>
		</div>
	</div>
	<%@ include file="fragments/mailCallSMAPopUpForms.jsp"%>
	<!-- Add Lead Modal -->
	<div class="modal fade" id="addLeadModal" tabindex="-1" role="dialog"
		aria-labelledby="addLeadModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addLeadModalLabel">Update Lead
						Detail's</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="/addNewLead" method="post">
						<div class="form-group">
							<label for="LID">Lead ID:</label> <input type="text" id="LID"
								name="LID" readonly class="form-control" value="${lead.LID}"
								required>
						</div>
						<div class="form-group">
							<label for="leadName">Lead Name:</label> <input type="text"
								id="leadName" name="leadName" value="${lead.leadName}"
								class="form-control" required>
						</div>
						<div class="form-group">
							<input type="hidden" value="${lead.leadStatus}" id="leadStatus"
								name="leadStatus" value="Received">
						</div>
						<div class="form-group">
							<label for="email">Email:</label> <input type="email" id="email"
								name="email" value="${lead.email}" class="form-control">
						</div>
						<div class="form-group">
							<label for="contactNo">Contact Number:</label> <input type="text"
								id="contactNo" name="contactNo" value="${lead.contactNo}"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="lookingFor">Looking For:</label> <select
								id="lookingFor" name="lookingFor" class="form-control">
								<option value="">-Select-</option>
								<option value="Full Stack Java">Full Stack Java</option>
								<option value="Full Stack Python">Full Stack Python</option>
								<option value="Angular">Angular</option>
								<option value="React">React</option>
								<option value="Internship">Internship</option>
								<option value="Placements">Placements</option>
							</select>
						</div>
						<div class="form-group">
							<label for="leadSource">Lead Source:</label> <select
								id="leadSource" name="leadSource" class="form-control">
								<option value="">-Select-</option>
								<option value="Walk-in">Walk-in</option>
								<option value="Social Media">Social Media</option>
								<option value="Inbound Email">Inbound Email</option>
								<option value="Inbound SMS">Inbound SMS</option>
								<option value="Referral Sites">Referral Sites</option>
							</select>
						</div>
						<div class="form-group">
							<label for="preferedLocation">Preferred Location:</label> <select
								id="preferedLocation" name="preferedLocation"
								class="form-control">
								<option value="">-Select-</option>
								<option value="Madurai">Madurai</option>
								<option value="Chennai">Chennai</option>
								<option value="Bangalore">Bangalore</option>
								<option value="Tirunelveli">Tirunelveli</option>
								<option value="Coimbatore">Coimbatore</option>
							</select>
						</div>
						<div class="form-group">
							<label for="notes">Notes:</label>
							<textarea id="notes" name="notes" value="${lead.notes}"
								class="form-control" maxlength="1500"></textarea>
						</div>
						<button type="submit" class="btn btn-primary">Add Lead</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Scripts -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
