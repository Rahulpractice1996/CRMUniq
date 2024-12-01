
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
							<input type="hidden" name="LID" value="${lead.LID}"> <label
								for="recipientEmail">Recipient Email</label> <input type="email"
								class="form-control" name="toEmail" value="${lead.email}"
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
					<form action="/sendSms" method="post">
						
						<div class="form-group">
						<input type="hidden" name="LID" value="${lead.LID}"> 
						<label for="phoneNumber">Phone Number</label> 
						<input type="text"
							readonly class="form-control" id="phoneNumber" name="toPhoneNumber"
							placeholder="Enter phone number" value="+91${lead.contactNo}">
				</div>

				<div class="form-group">
					<label for="smsSubject">Subject</label>
					 <input type="text" class="form-control" id="smsSubject" name= "subject" placeholder="Enter subject">
				</div>
				<div class="form-group">
					<label for="smsBody">Message</label>
					<textarea class="form-control" id="smsBody" rows="5" name="message"
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
					<form action="/calling" method="post">
						<input type="hidden" name="LID" value="${lead.LID}"> 

						<div class="form-group">
							<label for="phoneNumber">Phone Number</label> <input type="text"
								readonly class="form-control" id="phoneNumber" name="Contactno"
								placeholder="Enter phone number" value="+91${lead.contactNo}">
						</div>
						<button type="submit" class="btn btn-primary">Make Call</button>

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

