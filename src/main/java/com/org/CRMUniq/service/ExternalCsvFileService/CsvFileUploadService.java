package com.org.CRMUniq.service.ExternalCsvFileService;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.org.CRMUniq.model.Leads;
import com.org.CRMUniq.service.LeadService;

@Service
public class CsvFileUploadService {
	
	@Autowired
	LeadService leadService;
	
	private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    public List<Leads> uploadLeads(MultipartFile file) throws IOException {
        List<Leads> leadsList = new ArrayList<>();
        BufferedReader reader = new BufferedReader(new InputStreamReader(file.getInputStream()));
        CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT.withHeader());

        try (reader;csvParser) {

            for (CSVRecord record : csvParser) {
                Leads lead = new Leads();
                lead.setLeadName(record.get("Lead Name"));
                lead.setLeadStatus(record.get("Lead Status"));
                lead.setEmail(record.get("Email"));
                lead.setContactNo(record.get("Contact No"));
                lead.setLookingFor(record.get("Looking For"));
                lead.setLeadSource(record.get("Lead Source"));
                lead.setPreferedLocation(record.get("Preferred Location"));
                lead.setNotes(record.get("Notes"));
                try {
                    lead.setBeginDate(DATE_FORMAT.parse(record.get("Begin Date")));
                } catch (ParseException e) {
                    throw new RuntimeException("Invalid date format. Please use 'yyyy-MM-dd'.", e);
                }
                
                leadsList.add(lead);
            }
        }
        return leadService.AddAllLead(leadsList);
    }
}
