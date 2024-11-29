package com.org.CRMUniq.service.CommunicationService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


@Service
public class EmailSenderService {
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	public void sendEmail(SendEmail sendEmail) {
		
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom("varunkumar9095@gmail.com");
		message.setTo(sendEmail.getToEmail());
		message.setSubject(sendEmail.getSubject());
		message.setText(sendEmail.getBody());		
		javaMailSender.send(message);
		

	
	}
	

}