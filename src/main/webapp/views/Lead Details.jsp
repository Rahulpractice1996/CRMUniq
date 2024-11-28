<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lead Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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

    .header-section, .lead-properties, .activity-history, .right-section-nav {
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

    </style>
</head>
<body>
<%@ include file="fragments/nav.jsp" %>

    <div class="container-fluid main-container">
        <!-- Left Section -->
        <div class="left-section">
            <!-- Header Section -->
            <div class="header-section">
                <h4 class="lead-name">${leads.leadName}</h4>
                <p class="lead-location text-muted">Coimbatore, Tamil Nadu, India</p>
                <span class="status-badge">${leads.leadStatus}</span>
                <div class="d-flex">
                    <button class="btn btn-icon"><i class="material-icons">star</i></button>
                    <button class="btn btn-icon"><i class="material-icons">edit</i></button>
                    <button class="btn btn-icon"><i class="material-icons">settings</i></button>
                </div>
            </div>
            
            <!-- Lead Properties Section -->
            <div class="lead-properties">
                <h5><b>Lead Properties</b></h5>
                <p><strong>Owner:</strong> ${leads.leadOwner}</p>
                <p><strong>Lead Created on:</strong> ${leads.beginDate}</p>
                <p><strong>Last Modified on:</strong> ${leads.endDate}</p>
                <p><strong>Enquired About:</strong> ${leads.lookingFor}</p>
                <p><strong>Remarks:</strong> ${leads.notes}</p>
                <p><strong>Lead Age:</strong> ${leads.leadAge}</p>
                <p><strong>leadSource:</strong> ${leads.leadSource}</p>
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
                            <li class="nav-item">
                                <a class="nav-link" href="#"><i class="icon material-icons">email </i></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"><i class="icon material-icons">phone</i></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"><i class="icon material-icons">sms</i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Activity History Section -->
            <div class="activity-history">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h5>Activity History</h5>
                    <select class="form-control activity-filter">
                        <option value="all">All Time</option>
                        <option value="week">Last Week</option>
                        <option value="month">Last Month</option>
                    </select>
                </div>
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
                
                    <div class="activity-item">
                        <i class="icon material-icons">email </i>
                        <div>
                            <p>Sent notification email with subject: <strong>Full Details about Training</strong></p>
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
                    <div class="activity-item">
                        <i class="icon material-icons">phone</i>
                        <div>
                            <p>Inbound Call: Had a phone call with Lekha <span>(Duration: 41 seconds)</span></p>
                            <span class="timestamp">12 Dec 2023 - 01:34 PM</span>
                        </div>
                    </div>
                    <div class="activity-item">
                        <i class="icon material-icons">phone</i>
                        <div>
                            <p>Outbound Call: Did not answer a call by Lekha <span>(Duration: 0 seconds)</span></p>
                            <span class="timestamp">11 Dec 2023 - 06:26 PM</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap and JavaScript -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>