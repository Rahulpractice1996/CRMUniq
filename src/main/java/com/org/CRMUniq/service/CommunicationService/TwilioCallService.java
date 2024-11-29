package com.org.CRMUniq.service.CommunicationService;

import java.net.URI;

import org.springframework.stereotype.Service;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Call;
import com.twilio.type.PhoneNumber;

@Service
public class TwilioCallService {

   
    private String accountSid = "ACc3b9fee34b78115b728db8b4fae55d51";

    private String authToken="7529dc6c2ce1b743cd7ab3b76a35f724";
   
    private String twilioPhoneNumber ="+16814848996";

    public String makeCall(String toPhoneNumber) {
       
        Twilio.init(accountSid, authToken);

        try {
       
        	Call call = Call.creator(
                    new PhoneNumber(toPhoneNumber),  // The recipient's phone number
                    new PhoneNumber(twilioPhoneNumber),  // Your Twilio phone number
                    URI.create("http://demo.twilio.com/docs/voice.xml"))  // Twilio XML for call actions
                .create();

            return "Call initiated successfully! Call SID: " + call.getSid();
        } catch (Exception e) {
            return "Failed to make call: " + e.getMessage();
        }
    }
}
