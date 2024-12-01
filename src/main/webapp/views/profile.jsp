<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile Dashboard</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link rel="stylesheet" href="views/css/main.css">
<!-- Google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<body>
	<%@ include file="fragments/nav.jsp"%>

	<div class="container mt-5">
		<div class="card h-100">
			<div class="row no-gutters">
				<!-- Left Section -->
				<div class="col-md-6 text-center p-4 border-right">
					<div class="mb-3">
						<img id="profileImage" src="https://via.placeholder.com/150"
							alt="Profile" class="rounded-circle img-thumbnail">
					</div>
					<div class="mb-3">
						<label for="profileImageUpload" class="btn btn-primary">
							Upload Profile Image </label> <input type="file" id="profileImageUpload"
							class="d-none" accept="image/*" onchange="previewImage(event)">
					</div>
					<h4 class="mb-2">
						<span class="badge badge-info">Lead</span>
					</h4>
					<h5 class="mb-1">${user.uname}</h5>
					<p class="text-muted">User ID: ${user.EID}</p>
				</div>
				<!-- Right Section -->
				<div class="col-md-6 p-4">
					<!-- Upper Right Half -->
					<div class="mb-5">
						<h5 class="mb-3">Contact Information</h5>
						<div>
							<strong>Phone:</strong> ${user.contact}
						</div>
						<div>
							<strong>Email:</strong> ${user.email}
						</div>
						<div>
							<strong>Designation:</strong> ${user.role}
						</div>
					</div>
					<!-- Lower Right Half -->
					<div>
						<h5 class="mb-3">Contact via:</h5>
						<button class="btn btn-light btn-lg mr-2"
							onclick="chatOption('email')">
							<span class="material-icons">email</span> Email
						</button>
						<button class="btn btn-light btn-lg mr-2"
							onclick="chatOption('phone')">
							<span class="material-icons">phone</span> Phone
						</button>
						<button class="btn btn-light btn-lg" onclick="chatOption('sms')">
							<span class="material-icons">sms</span> SMS
						</button>
						<div class="mt-4">
							<h5>Chat Box</h5>
							<textarea class="form-control" rows="3"
								placeholder="Type your message here..."></textarea>
							<button class="btn btn-success mt-2">Send</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap and JavaScript -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
		// Preview uploaded profile image
		function previewImage(event) {
			const reader = new FileReader();
			reader.onload = function() {
				const output = document.getElementById('profileImage');
				output.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);
		}

		// Chat option handler
		function chatOption(option) {
			let message = '';
			switch (option) {
			case 'email':
				message = 'Opening email client...';
				break;
			case 'phone':
				message = 'Dialing phone number...';
				break;
			case 'sms':
				message = 'Opening SMS application...';
				break;
			}
			alert(message);
		}
	</script>
</body>
</html>
