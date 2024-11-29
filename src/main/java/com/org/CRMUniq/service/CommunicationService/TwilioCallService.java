package com.org.CRMUniq.service.CommunicationService;
import java.net.URI;
import java.util.concurrent.TimeUnit;

import org.springframework.stereotype.Service;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Call;
import com.twilio.type.PhoneNumber;

@Service
public class TwilioCallService {

    private String accountSid = "ACc3b9fee34b78115b728db8b4fae55d51";
    private String authToken = "1dd364ed8ff2115112bb8fabc13d0fd0";
    private String twilioPhoneNumber = "+16814848996";

    public String makeCall(String toPhoneNumber) {
        Twilio.init(accountSid, authToken);

        try {
            // Initiate the call
            Call call = Call.creator(
                    new PhoneNumber(toPhoneNumber),
                    new PhoneNumber(twilioPhoneNumber),
                    URI.create("http://demo.twilio.com/docs/voice.xml"))
                .create();

            // Poll for call completion
            String callSid = call.getSid();
            Call.Status status;
            int retries = 0;

            do {
                TimeUnit.SECONDS.sleep(5); // Wait for 5 seconds between checks
                call = Call.fetcher(callSid).fetch();
                status = call.getStatus();
                retries++;
            } while ((status == Call.Status.IN_PROGRESS || status == Call.Status.QUEUED || status == Call.Status.RINGING) && retries < 12);

            // Retrieve and return the call duration
            return "Call completed. Duration: " + call.getDuration() + " seconds. Call SID: " + callSid;
        } catch (Exception e) {
            return "Failed to make call: " + e.getMessage();
        }
    }
}