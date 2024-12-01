<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Homepage</title>
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

	<div class="container-fluid mt-4">
		<div class="d-flex justify-content-between align-items-center mb-3">
			<h2>${users.role}'s Dashboard | Welcome Mr. ${users.uname}</h2>
			<h4 class="d-inline">
				Add Employee:
				<button class="btn btn-primary" data-bs-toggle="modal"
					data-bs-target="#addHumanResourceModal">
					<i class="material-icons">person_add</i>
				</button>
			</h4>
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
								<h4 class="text-dark">${countObj.totalLeads}</h4>
							</div>
						</div>
						<div class="col-6 mb-3">
							<div class="card p-3">
								<p class="text-dark mb-1">New Leads</p>
								<h4 class="text-dark">${countObj.newLeads}</h4>
							</div>
						</div>
						<!-- Row 2 -->
						<div class="col-6 mb-3">
							<div class="card p-3">
								<p class="text-dark mb-1">InProgress Leads</p>
								<h4 class="text-dark">${countObj.in_progress}</h4>
							</div>
						</div>
						<div class="col-6 mb-3">
							<div class="card p-3">
								<p class="text-dark mb-1">Ready To Join Leads</p>
								<h4 class="text-dark">${countObj.ready_to_join}</h4>
							</div>
						</div>
						<!-- Row 3 -->
						<div class="col-6 mb-3">
							<div class="card p-3">
								<p class="text-dark mb-1">Rejected Leads</p>
								<h4 class="text-dark">${countObj.rejected}</h4>
							</div>
						</div>
						<div class="col-6 mb-3">
							<div class="card p-3">
								<p class="text-dark mb-1">Enrolled Leads</p>
								<h4 class="text-dark">${countObj.enrolled}</h4>
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

		<!-- Email Form Section -->
		<div class="row mt-4">
			<div class="col-md-4">
				<div class="dashboard-card">
					<div class="d-flex justify-content-between">
						<span class="card-title">Recently Sent Email Campaigns</span> <i
							class="material-icons card-icon">email</i>
					</div>
					<p class="text-muted mt-3" id="emailStatus">You haven't sent
						any emails yet</p>
					<button class="btn btn-primary" data-bs-toggle="modal"
						data-bs-target="#emailModal">Send Emails Now</button>
				</div>
			</div>
		</div>

		<!-- Modal for Sending Email -->
		<div class="modal fade" id="emailModal" tabindex="-1"
			aria-labelledby="emailModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="emailModalLabel">Send Email
							Campaign</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="/MailtoMultiple" method="POST">
							<div class="mb-3">
								<label for="subject" class="form-label">Subject</label> <input
									type="text" class="form-control" id="subject" name="subject"
									required>
							</div>
							<div class="mb-3">
								<label for="body" class="form-label">Body</label>
								<textarea class="form-control" id="body" name="body" rows="4"
									required></textarea>
							</div>
							<div class="d-grid">
								<button type="submit" class="btn btn-primary">Send
									Emails</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- Success Modal -->
		<div class="modal fade" id="emailSuccessModal" tabindex="-1"
			aria-labelledby="successModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="successModalLabel">Success</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>Emails sent successfully!</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Failure Modal -->
		<div class="modal fade" id="emailFailureModal" tabindex="-1"
			aria-labelledby="failureModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="failureModalLabel">Error</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p>There was an error sending the emails. Please try again.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Script to Show Modals Based on Flash Attributes -->
		<script>
	    document.addEventListener('DOMContentLoaded', function () {
	        // Use Thymeleaf or other templating engine to inject flash attribute status
	        const status = /*[[${status}]]*/ ""; // Replace with actual server-side logic
	        
	        if (status === 'emailsuccess') {
	            const successModal = new bootstrap.Modal(document.getElementById('emailSuccessModal'));
	            successModal.show();
	        } else if (status === 'emailfailure') {
	            const failureModal = new bootstrap.Modal(document.getElementById('emailFailureModal'));
	            failureModal.show();
	        }
	    });
	</script>

		<!-- End of Recently Sent Email Campaigns Row -->

	</div>

	<!-- Add Human Resource Modal -->
	<div class="modal fade" id="addHumanResourceModal" tabindex="-1"
		aria-labelledby="addHumanResourceModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addHumanResourceModalLabel">Add
						New Employee</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="/addHumanResource" method="post">
						<div class="mb-3">
							<label for="role" class="form-label">Role:</label> <select
								id="role" name="role" class="form-select" required>
								<option value="Admin">Admin</option>
								<option value="Manager">Manager</option>
								<option value="SalesUser">Sales User</option>
							</select>
						</div>
						<div class="mb-3">
							<label for="uname" class="form-label">Username:</label> <input
								type="text" id="uname" name="uname" class="form-control"
								required>
						</div>
						<div class="mb-3">
							<label for="pwd" class="form-label">Password:</label> <input
								type="password" id="pwd" name="pwd" class="form-control"
								required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email:</label> <input
								type="email" id="email" name="email" class="form-control"
								required>
						</div>
						<div class="mb-3">
							<label for="contact_no" class="form-label">Mobile:</label> <input
								type="text" id="contact_no" name="contact" class="form-control"
								required>
						</div>
						<div class="d-grid">
							<button type="submit" class="btn btn-primary">Register</button>
						</div>
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



	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
    let dailyLeadChart;

    // Function to fetch real-time data and update the chart
    function fetchAndUpdateChart() {
        fetch('/leadMetrics')  // Make an API call to get the latest metrics
            .then(response => response.json())
            .then(data => {
                // Update the chart data
                if (dailyLeadChart) {
                    dailyLeadChart.data.datasets[0].data = [
                        data.totalLeads,
                        data.newLeads,
                        data.in_progress,
                        data.ready_to_join,
                        data.rejected,
                        data.enrolled
                    ];
                    dailyLeadChart.update(); // Re-render the chart with new data
                }
            })
            .catch(error => console.error('Error fetching data:', error));
    }

    // Initialize the chart when the page is loaded
    document.addEventListener('DOMContentLoaded', () => {
        const ctx = document.getElementById('dailyLeadChart').getContext('2d');
        dailyLeadChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Total Leads', 'New Leads', 'In Progress Leads', 'Ready To Join Leads', 'Rejected Leads', 'Enrolled Leads'],
                datasets: [{
                    label: 'Number of Leads',
                    data: [0, 0, 0, 0, 0, 0], // Initial data (will be updated later)
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 10  // Set the step size to 10 for intervals
                        }
                    }
                }
            }
        });

        // Initial fetch of data to populate the chart
        fetchAndUpdateChart();

        // Set up an interval to fetch new data every 10 seconds and update the chart
        setInterval(fetchAndUpdateChart, 10000); // Update every 10 seconds
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

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
