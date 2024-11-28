<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Lead</title>
<link rel="stylesheet" type="text/css" href="views/css/main.css">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    .leadcontainer {
        width: 80%;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .leadcontainer h2 {
        text-align: center;
        color: #333;
    }

    .leadcontainer .form-group {
        margin-bottom: 15px;
    }

    .leadcontainer .form-group label {
        display: block;
        margin-bottom: 6px;
        font-weight: bold;
        color: #555;
    }

    .leadcontainer .form-group input,
    .leadcontainer .form-group select,
    .leadcontainer .form-group textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 16px;
        transition: border-color 0.3s;
    }

    .leadcontainer .form-group input[type="date"] {
        width: auto; /* Make date fields shorter */
    }

    .leadcontainer .form-group input:focus,
    .leadcontainer .form-group select:focus,
    .leadcontainer .form-group textarea:focus {
        border-color: #007bff;
        outline: none;
    }

    .leadcontainer button {
        padding: 12px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s;
        display: block;
        margin: 20px auto;
    }

    .leadcontainer button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<%@ include file="fragments/nav.jsp" %>
    <div class="leadcontainer">
        <p>${message}</p>
        <h2>Quick Add Lead</h2>
        <form action="/addNewLead" method="post">
            <div class="form-group">
                <label for="leadName">Lead Name:</label>
                <input type="text" id="leadName" name="leadName" required>
            </div>
            <div class="form-group">
                <input type="hidden" id="leadStatus" name="leadStatus" value="Received">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="contactNo">Contact Number:</label>
                <input type="text" id="contactNo" name="contactNo">
            </div>
            <div class="form-group">
                <label for="lookingFor">Looking For:</label>
                <select id="lookingFor" name="lookingFor">
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
                <label for="leadSource">Lead Source:</label>
                <select id="leadSource" name="leadSource">
                    <option value="">-Select-</option>
                    <option value="Walk-in">Walk-in</option>
                    <option value="Social Media">Social Media</option>
                    <option value="Inbound Email">Inbound Email</option>
                    <option value="Inbound SMS">Inbound SMS</option>
                    <option value="Referral Sites">Referral Sites</option>
                </select>
            </div>
            <div class="form-group">
                <label for="preferedLocation">Preferred Location:</label>
                <select id="preferedLocation" name="preferedLocation">
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
                <textarea id="notes" name="notes" maxlength="1500"></textarea>
            </div>

            <button type="submit">Add Lead</button>
        </form>
    </div>
</body>
</html>
