<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Homepage</title>
    <link rel="stylesheet" href="views/css/main.css">
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<%@ include file="fragments/nav.jsp" %>

<div class="container-fluid mt-4">
	<div class="d-flex justify-content-between align-items-center mb-3">
	    <h3>${users.role}'s Dashboard | Welcome Mr. ${users.uname}</h3>
	    <h4 class="d-inline">
	        Add Human Resources:
	        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addHumanResourceModal">
	            <i class="material-icons">person_add</i>
	        </button>
	    </h4>  
	</div>
	<div class="row">
        <!-- Key Lead Metrics -->
        <div class="col-md-4">
            <div class="dashboard-card">
                <div class="d-flex justify-content-between">
                    <span class="card-title">Key Lead Metrics</span>
                    <i class="material-icons card-icon">settings</i>
                </div>
                <div class="row mt-3">
                    <div class="col-6">
                        <p class="text-muted mb-1">Active Leads</p>
                        <h4>90%</h4>
                    </div>
                    <div class="col-6">
                        <p class="text-muted mb-1">Engagement</p>
                        <h4>3%</h4>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-6">
                        <p class="text-muted mb-1">New Leads</p>
                        <h4>9,972</h4>
                    </div>
                    <div class="col-6">
                        <p class="text-muted mb-1">Overall Leads</p>
                        <h4>91%</h4>
                    </div>
                </div>
            </div>
        </div>

        <!-- Daily Lead Addition Chart -->
        <div class="col-md-8">
            <div class="dashboard-card">
                <div class="d-flex justify-content-between">
                    <span class="card-title">Daily Lead Addition</span>
                    <i class="material-icons card-icon">bar_chart</i>
                </div>
                <div class="chart-container">
                    <canvas id="dailyLeadChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Leads by Sources -->
        <div class="col-md-4">
            <div class="dashboard-card">
                <div class="d-flex justify-content-between">
                    <span class="card-title">Leads by Sources</span>
                    <i class="material-icons card-icon">insights</i>
                </div>
                <div class="chart-container">
                    <canvas id="sourceChart"></canvas>
                </div>
            </div>
        </div>

        <!-- Recently Sent Email Campaigns -->
        <div class="col-md-4">
            <div class="dashboard-card">
                <div class="d-flex justify-content-between">
                    <span class="card-title">Recently Sent Email Campaigns</span>
                    <i class="material-icons card-icon">email</i>
                </div>
                <p class="text-muted mt-3">You haven't sent any emails yet</p>
                <button class="btn btn-primary">Send Emails Now</button>
            </div>
        </div>

        <!-- Top Landing Pages -->
        <div class="col-md-4">
            <div class="dashboard-card">
                <div class="d-flex justify-content-between">
                    <span class="card-title">Top Landing Pages</span>
                    <i class="material-icons card-icon">pageview</i>
                </div>
                <table class="mt-3">
                    <thead>
                        <tr>
                            <th>Page Name</th>
                            <th>Submits</th>
                            <th>Conversion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Job-Enquiry</td>
                            <td>697</td>
                            <td>100%</td>
                        </tr>
                        <tr>
                            <td>Job_Enquiry_Reg4</td>
                            <td>71</td>
                            <td>100%</td>
                        </tr>
                        <tr>
                            <td>Course Enq</td>
                            <td>17</td>
                            <td>100%</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Add Human Resource Modal -->
<div class="modal fade" id="addHumanResourceModal" tabindex="-1" aria-labelledby="addHumanResourceModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addHumanResourceModalLabel">Add Human Resource</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/addHumanResource" method="post">
                    <div class="mb-3">
                        <label for="role" class="form-label">Role:</label>
                        <select id="role" name="role" class="form-select" required>
                            <option value="Admin">Admin</option>
                            <option value="Manager">Manager</option>
                            <option value="SalesUser">Sales User</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="uname" class="form-label">Username:</label>
                        <input type="text" id="uname" name="uname" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="pwd" class="form-label">Password:</label>
                        <input type="password" id="pwd" name="pwd" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" id="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="contact_no" class="form-label">Mobile:</label>
                        <input type="text" id="contact_no" name="contact" class="form-control" required>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">Register</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Chart.js Scripts -->
<script>
    const ctx1 = document.getElementById('dailyLeadChart').getContext('2d');
    new Chart(ctx1, {
        type: 'line',
        data: {
            labels: ['Oct 28', 'Nov 1', 'Nov 7', 'Nov 14', 'Nov 21'],
            datasets: [{
                label: 'Leads',
                data: [300, 500, 700, 2000, 2500],
                borderColor: '#6c63ff',
                backgroundColor: 'rgba(108, 99, 255, 0.1)',
                tension: 0.4,
                fill: true
            }]
        }
    });

    const ctx2 = document.getElementById('sourceChart').getContext('2d');
    new Chart(ctx2, {
        type: 'bar',
        data: {
            labels: ['Source 1', 'Source 2', 'Source 3'],
            datasets: [{
                label: '# of Leads',
                data: [1200, 1500, 2000],
                backgroundColor: ['#ff6b6b', '#6bcfff', '#63ff6c']
            }]
        }
    });
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<%@ include file="fragments/footer.jsp" %>
</body>
</html>
