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
	flex: 1 1 30%;
	max-width: 30%;
}

.right-section {
	flex: 1 1 68%;
	max-width: 68%;
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
	width: auto; /* Adjust to match the badge size */
	height: auto;
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
				<h4 class="lead-name">${leads.leadName}</h4>
				<p class="lead-location text-muted">${leads.preferedLocation},
					Tamil Nadu, India</p>
				<!-- Display current status as a badge -->
				<span class="status-badge">${leads.leadStatus}</span>
				<!-- Status Badge and Dropdown Box -->
				<div class="status-dropdown">
					<!-- Dropdown menu for selecting a new status -->
					<form action="LeadDetails" method="get">
						<input type="hidden" name="LID" value="${leads.LID}"> <select
							id="statusSelect" class="status-select" name="status">
							<option value="new">New</option>
							<option value="inProgress">In Progress</option>
							<option value="closed">Closed</option>
							<option value="rejected">Rejected</option>
						</select>
						<!-- Change Status Button -->
						<input type="submit" class="changeStatus" value="Change Status">
					</form>
				</div>

				<!-- Action Buttons (Star, Edit, Settings) -->
				<div class="d-flex">
					<button class="btn btn-icon">
						<i class="material-icons">star</i>
					</button>
					<button class="btn btn-icon">
						<i class="material-icons">edit</i>
					</button>
					<button class="btn btn-icon">
						<i class="material-icons">settings</i>
					</button>
				</div>
			</div>

			<!-- Lead Properties Section -->
			<div class="lead-properties">
				<h5>
					<b>Lead Properties</b>
				</h5>
				<p>
					<strong>Owner:</strong> ${leads.leadOwner}
				</p>
				<p>
					<strong>Lead Created on:</strong> ${leads.beginDate}
				</p>
				<p>
					<strong>Last Modified on:</strong> ${leads.endDate}
				</p>
				<p>
					<strong>Enquired About:</strong> ${leads.lookingFor}
				</p>
				<p>
					<strong>Remarks:</strong> ${leads.notes}
				</p>
				<p>
					<strong>Lead Age:</strong> ${leads.leadAge}
				</p>
				<p>
					<strong>leadSource:</strong> ${leads.leadSource}
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
					<c:forEach var="transaction" items="${leads.transactions}">
						<div class="activity-item">
							<i class="icon material-icons">${transaction.contactType}</i>
							<div>
								<p>${transaction.remarks}</p>
								<span class="timestamp">${transaction.dateTimeStamp}</span>
							</div>
						</div>
					</c:forEach>

					<!-- Sample Activity Items -->
					<div class="activity-item">
						<i class="icon material-icons">email </i>
						<div>
							<p>
								Sent notification email with subject: <strong>Full
									Details about Training</strong>
							</p>
							<span class="timestamp">03 Aug 2024 - 04:12 PM</span>
						</div>
					</div>
					<div class="activity-item">
						<i class="icon material-icons">visibility</i>
						<div>
							<p>Viewed landing page Job-Enquiry and submitted form</p>
							<span class="timestamp">03 Aug 2024 - 04:12 PM</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Email Modal -->
	<div class="modal fade" id="emailModal" tabindex="-1" role="dialog"
		aria-labelledby="emailModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="emailModalLabel">Compose Email</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="/sendEmail" method="post">
						<div class="form-group">
							<input type="hidden" name="LID" value="${leads.LID}"> <label
								for="recipientEmail">Recipient Email</label> <input type="email"
								class="form-control" name="toEmail" value="${leads.email}"
								readonly name="email" id="recipientEmail"
								placeholder="Enter recipient's email">
						</div>
						<div class="form-group">
							<label for="subject">Subject</label> <input type="text"
								class="form-control" id="subject" name="subject"
								placeholder="Enter subject">
						</div>
						<div class="form-group">
							<label for="message">Message</label>
							<textarea class="form-control" id="message" rows="5" name="body"
								placeholder="Enter message"></textarea>
						</div>

						<button type="submit" class="btn btn-primary">Send Email</button>

					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- SMS Modal -->
	<div class="modal fade" id="smsModal" tabindex="-1" role="dialog"
		aria-labelledby="smsModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="smsModalLabel">Compose SMS</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="/sms">
						
						<div class="form-group">
						<input type="hidden" name="LID" value="${leads.LID}"> 
						<label for="phoneNumber">Phone Number</label> 
						<input type="text"
							readonly class="form-control" id="phoneNumber"
							placeholder="Enter phone number" value="${leads.contactNo}">
				</div>

				<div class="form-group">
					<label for="smsSubject">Subject</label> <input type="text"
						class="form-control" id="smsSubject" placeholder="Enter subject">
				</div>
				<div class="form-group">
					<label for="smsBody">Message</label>
					<textarea class="form-control" id="smsBody" rows="5"
						placeholder="Enter message"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">Send SMS</button>

				</form>
			</div>

		</div>
	</div>
	</div>

	<!-- Phone Modal -->
	<div class="modal fade" id="phoneModal" tabindex="-1" role="dialog"
		aria-labelledby="phoneModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="phoneModalLabel">Make a Call</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>

						<div class="form-group">
							<label for="phoneNumber">Phone Number</label> <input type="text"
								readonly class="form-control" id="phoneNumber"
								placeholder="Enter phone number" value="${leads.contactNo}">
						</div>
						<button type="button" class="btn btn-primary">Make Call</button>

					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- Bootstrap and JavaScript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>


</body>
</html>
