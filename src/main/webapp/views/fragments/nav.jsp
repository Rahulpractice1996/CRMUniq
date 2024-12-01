<!--     <div class="navbar">
        <a href="/AdminHome" class="logo">CRM Application</a>
        <ul>
            <li><a href="/mysmartView">Smart View</a></li>        
            <li><a href="/leads">All Leads</a></li>
            <li><a href="/new-leads">Quick Add Lead</a></li>
            <li><a href="/ShowManagers">Manager</a></li>
            <li><a href="/SalesUser">Sales User</a></li>
            <li><a href="#">Logout</a></li>
              
        </ul>
    </div> -->
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <!-- Google Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <div class="navbar">
    <a href="/AdminHome" class="logo d-flex align-items-center">
        <!-- CRM Application Icon -->
        <i class="material-icons me-2">business</i>
        CRM Application
    </a>
    <ul>
    <sec:authorize access="hasRole('Manager')">
        <li><a href="/mysmartView">Smart View Leads</a></li>
     </sec:authorize>
     
        <li><a href="/leads">All Leads</a></li>
        <li><a href="/ShowManagers">All Managers</a></li>
        <li><a href="/SalesUser">All Sales Users</a></li>
        <li><a href="#">Logout</a></li>
    </ul>
</div>
    