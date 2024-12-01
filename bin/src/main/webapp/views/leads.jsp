<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Leads View</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&display=swap" />
<link rel="stylesheet" href="views/css/main.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

</head>
<body>

	<%@ include file="fragments/nav.jsp"%>
	<div class="Leadcontainer">
		<h2>Leads</h2>
		<div class="d-flex justify-content-between align-items-center mb-3">
			<h4>
				Upload Bulk Leads :
				<button class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#uploadLeadModal">
					<i class="material-icons">upload</i>
				</button>
			</h4>

			<h4 class="d-inline">
				Quick Add Lead :
				<button class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#quickAddLeadModal">
					<i class="material-icons">person_add</i>
				</button>
			</h4>
		</div>

		<form action="/AllocateLeads" method="POST">
			<p>Allocate leads to either Manager or salesuser</p>
			<div class="form-group-dropdown">
				<label for="managerSelect">Select Manager:</label> <select
					id="managerSelect" name="managerId">
					<option value="-1">-select-</option>
					<c:forEach var="manager" items="${Managers}">
						<option value="${manager.EID}">${manager.uname}</option>
					</c:forEach>
				</select> <label for="salesUserSelect">Select Sales User:</label> <select
					id="salesUserSelect" name="salesUserId">
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

	<!-- Download CSV Button -->
	<center>
		<h4>
			Download Leads :
			<button class="btn btn-success" data-bs-toggle="modal"
				data-bs-target="#downloadLeadModal">
				<i class="material-icons">download</i>
			</button>
		</h4>
	</center>


	<!-- Modal for Quick Add Lead -->
	<div class="modal fade" id="quickAddLeadModal" tabindex="-1"
		aria-labelledby="quickAddLeadModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="quickAddLeadModalLabel">Quick Add
						Lead</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="/addNewLead" method="post">
						<div class="form-group">
							<label for="leadName">Lead Name:</label> <input type="text"
								id="leadName" name="leadName" required class="form-control">
						</div>
						<div class="form-group">
							<input type="hidden" id="leadStatus" name="leadStatus"
								value="Received">
						</div>
						<div class="form-group">
							<label for="email">Email:</label> <input type="email" id="email"
								name="email" class="form-control">
						</div>
						<div class="form-group">
							<label for="contactNo">Contact Number:</label> <input type="text"
								id="contactNo" name="contactNo" class="form-control">
						</div>
						<div class="form-group">
							<label for="lookingFor">Looking For:</label> <select
								id="lookingFor" name="lookingFor" class="form-select">
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
								id="leadSource" name="leadSource" class="form-select">
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
								class="form-select">
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
							<textarea id="notes" name="notes" class="form-control"
								maxlength="1500"></textarea>
						</div>

						<button type="submit" class="btn btn-primary">Add Lead</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Success Modal -->
	<div class="modal fade" id="successModal" tabindex="-1"
		aria-labelledby="successModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="successModalLabel">Success</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">${message}</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for Uploading Bulk Leads -->
	<div class="modal fade" id="uploadLeadModal" tabindex="-1"
		aria-labelledby="uploadLeadModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="uploadLeadModalLabel">Upload Bulk
						Leads</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="/uploadLeads" method="post"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="fileUpload">Choose a file:</label> <input type="file"
								id="fileUpload" name="fileUpload" class="form-control"
								accept=".csv" required onchange="this.form.submit()">
						</div>
						<p class="mt-2 text-muted">* Supported formats: CSV</p>
						<div class="form-group mt-3">
							<button type="submit" class="btn btn-primary">Upload</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal for Downloading Leads -->
	<div class="modal fade" id="downloadLeadModal" tabindex="-1"
		aria-labelledby="downloadLeadModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="downloadLeadModalLabel">Download
						Leads</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Do you want to download the leads data as a CSV file?</p>
					<form action="/downloadLeads" method="get">
						<div class="form-group mt-3">
							<button type="submit" class="btn btn-danger">Download</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Cancel</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- Failure Modal -->
	<div class="modal fade" id="failureModal" tabindex="-1"
		aria-labelledby="failureModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="failureModalLabel">Failure</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">${message}</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${status == 'success'}">
			<script>
            document.addEventListener('DOMContentLoaded', () => {
                const successModal = new bootstrap.Modal(document.getElementById('successModal'));
                successModal.show();
            });
        </script>
		</c:when>
		<c:when test="${status == 'failure'}">
			<script>
            document.addEventListener('DOMContentLoaded', () => {
                const failureModal = new bootstrap.Modal(document.getElementById('failureModal'));
                failureModal.show();
            });
        </script>
		</c:when>
	</c:choose>

	<!-- Bootstrap JS (Popper.js and Bootstrap JS) -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
		
		</body>
		</html>