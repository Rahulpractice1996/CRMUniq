package com.org.CRMUniq.service.CommunicationService;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Call;
import com.twilio.type.PhoneNumber;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.net.URI;

@Service
public class TwilioCallService {

    @Value("${twilio.accountSid}")
    private String accountSid;

    @Value("${twilio.authToken}")
    private String authToken;

    @Value("${twilio.phoneNumber}")
    private String twilioPhoneNumber;

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
