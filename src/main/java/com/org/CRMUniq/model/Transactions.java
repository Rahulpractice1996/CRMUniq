package com.org.CRMUniq.model;


import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor

public class Transactions {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long TID;

    @Column(name = "date_time_stamp", nullable = false)
    private String dateTimeStamp;

    @Column(length = 2000)  // comments by LeadOwner
    private String remarks;

    @Column(name = "lead_status")
    private String leadStatus;

    @Column(name = "contact_type") // can be a call or mail or sms
    private String contactType;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JsonBackReference
    private Leads lead;

}
