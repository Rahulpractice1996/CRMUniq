package com.org.CRMUniq.service.CommunicationService;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @AllArgsConstructor @ToString
public class SmsRequest {

    private String toPhoneNumber;  
    private String subject; 
    private String message; 


}
