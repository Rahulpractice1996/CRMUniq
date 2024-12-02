<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<!-- Google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<div class="navbar">
	<sec:authorize access="hasRole('Admin')">
		<a href="/AdminHome" class="logo d-flex align-items-center"> <!-- CRM Application Icon -->
			<i class="material-icons me-2">business</i> CRM Application
		</a>
	</sec:authorize>
	<sec:authorize access="hasRole('Manager')">
		<a href="/Managerhome" class="logo d-flex align-items-center"> <!-- CRM Application Icon -->
			<i class="material-icons me-2">business</i> CRM Application
		</a>
	</sec:authorize>
	<sec:authorize access="hasRole('SalesUser')">
		<a href="/SalesUserHome" class="logo d-flex align-items-center"> <!-- CRM Application Icon -->
			<i class="material-icons me-2">business</i> CRM Application
		</a>
	</sec:authorize>
	<ul>
		<sec:authorize access="hasRole('Admin')">

			<li><a href="/mysmartView">Smart View Leads</a></li>
			<li><a href="/leads">All Leads</a></li>
			<li><a href="/ShowManagers">All Managers</a></li>
			<li><a href="/SalesUser">All Sales Users</a></li>
		</sec:authorize>
		<sec:authorize access="hasRole('Manager')">
			<li><a href="/AllLeadsManagerMysmartView">Team - View Leads</a></li>
			<li><a href="/mysmartView">My Task View</a></li>
			<li><a href="/leadsBucket">Leads bucket</a></li>
			<li><a
				href="/ViewSalesUsers?managerId=${manager.EID}&managerName=${manager.uname}">My
					Team</a></li>
		</sec:authorize>

		<sec:authorize access="hasRole('SalesUser')">
			<li><a href="/mysmartView">Lead Bucket</a></li>
		</sec:authorize>

		<li><a href="/profile">Profile</a></li>
		<li><a href="/logout">Logout</a></li>
	</ul>
</div>
