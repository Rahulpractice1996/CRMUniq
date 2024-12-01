package com.org.CRMUniq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.org.CRMUniq.model.DAO.CountLeadsByStatus;
import com.org.CRMUniq.service.LeadService;

@RestController
public class LeadChartController {

    @Autowired
    private LeadService leadService;

    // Endpoint to fetch lead status counts
    @GetMapping("/leadMetrics")
    public CountLeadsByStatus getLeadMetrics() {
        return leadService.countStatus(); // Call the service method to get the lead counts
    }
}