package com.org.CRMUniq.service.CommunicationService;

import org.springframework.stereotype.Service;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Service
public class SmsService {

    private String accountSid = "AC2f16317b7912ce564a4d5dcfc2f08d9e";

    private String authToken = "0353a8554712f9f39f4b3e3eb5c20c57";

    private String fromPhoneNumber = "+17753695345";

    public String sendSms(SmsRequest smsRequest) {
        Twilio.init(accountSid, authToken);

        Message message = Message.creator(
                new PhoneNumber(smsRequest.getToPhoneNumber()),
                new PhoneNumber(fromPhoneNumber),
                smsRequest.getMessage())
            .create();

        return message.getSid(); // Return the SID of the sent message
    }
}
