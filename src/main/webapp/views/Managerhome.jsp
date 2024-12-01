<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manager Home</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link rel="stylesheet" href="views/css/main.css">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QhEkiI1SNm5MgUhUcBJcEjCqYVUVsxkMLbIszTVhvvZcyVj2dbwtVMyC0RJ7hAfQ"
	crossorigin="anonymous">

</head>
<body>
	<%@ include file="fragments/nav.jsp"%>

	<div class="container-fluid">
		<!-- Navigation Bar -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">Manager Home</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						href="/AllLeadsManagerMysmartView">Team Leads</a></li>
					<li class="nav-item"><a class="nav-link" href="/mysmartView">My
							Task View</a></li>
					<li class="nav-item"><a class="nav-link" href="/leadsBucket">Leads
							bucket</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/ViewSalesUsers?managerId=${manager.EID}&managerName=${manager.uname}">My
							Team</a></li>
				</ul>
			</div>
		</nav>

		<div class="container-fluid mt-4">
			<div class="d-flex justify-content-between align-items-center mb-3">
				<h2> ${manager.role}'s Dashboard | Welcome Mr. ${manager.uname}</h2>
			</div>

			<div class="row">
				<!-- Key Lead Metrics (Left Side) -->
				<div class="col-md-4">
					<div class="dashboard-card">
						<div class="d-flex justify-content-between">
							<span class="card-title text-dark">Key Lead Metrics</span> <i
								class="material-icons card-icon text-dark">settings</i>
						</div>
						<div class="row mt-3">
							<!-- Row 1 -->
							<div class="col-6 mb-3">
								<div class="card p-3">
									<p class="text-dark mb-1">Total Leads</p>
									<h4 class="text-dark">90%</h4>
								</div>
							</div>
							<div class="col-6 mb-3">
								<div class="card p-3">
									<p class="text-dark mb-1">New Leads</p>
									<h4 class="text-dark">3%</h4>
								</div>
							</div>
							<!-- Row 2 -->
							<div class="col-6 mb-3">
								<div class="card p-3">
									<p class="text-dark mb-1">InProgress Leads</p>
									<h4 class="text-dark">9,972</h4>
								</div>
							</div>
							<div class="col-6 mb-3">
								<div class="card p-3">
									<p class="text-dark mb-1">Ready To Join Leads</p>
									<h4 class="text-dark">91%</h4>
								</div>
							</div>
							<!-- Row 3 -->
							<div class="col-6 mb-3">
								<div class="card p-3">
									<p class="text-dark mb-1">Rejected Leads</p>
									<h4 class="text-dark">15%</h4>
								</div>
							</div>
							<div class="col-6 mb-3">
								<div class="card p-3">
									<p class="text-dark mb-1">Enrolled Leads</p>
									<h4 class="text-dark">1,230</h4>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Daily Lead Addition Chart (Right Side of Key Lead Metrics) -->
				<div class="col-md-8">
					<div class="dashboard-card">
						<div class="d-flex justify-content-between">
							<span class="card-title text-dark">Daily Lead Addition</span> <i
								class="material-icons card-icon text-dark">bar_chart</i>
						</div>
						<div class="chart-container"
							style="position: relative; height: 60vh; width: 100%;">
							<canvas id="dailyLeadChart"></canvas>
						</div>
					</div>
				</div>

			</div>
			<!-- End of Row -->

			<div class="row mt-4">
				<!-- Recently Sent Email Campaigns (Placed Below Key Metrics) -->
				<div class="col-md-4">
					<div class="dashboard-card">
						<div class="d-flex justify-content-between">
							<span class="card-title">Recently Sent Email Campaigns</span> <i
								class="material-icons card-icon">email</i>
						</div>
						<p class="text-muted mt-3">You haven't sent any emails yet</p>
						<button class="btn btn-primary">Send Emails Now</button>
					</div>
				</div>
			</div>
			<!-- End of Recently Sent Email Campaigns Row -->

		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
		const ctx = document.getElementById('dailyLeadChart').getContext('2d');
		const dailyLeadChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ 'TotalLeads', 'NewLeads', 'InProgressLeads',
						'ReadyToJoinLeads', 'RejectedLeads', 'EnrolledLeads' ],
				datasets : [ {
					label : 'NUmber Of Leads',
					data : [ 12, 19, 3, 5, 2, 3 ],
					backgroundColor : 'rgba(75, 192, 192, 0.2)',
					borderColor : 'rgba(75, 192, 192, 1)',
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});
	</script>

	<!-- Bootstrap and JavaScript -->
	<!-- Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OMJ0D0z9l+RxCz4pv/NX0k+qzjTz1y3dtx4ZW/r5KKEV9kpKOJv3yknhOQh1B2XD"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
