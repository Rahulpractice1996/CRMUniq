package com.org.CRMUniq.service.ExternalCsvFileService;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.CRMUniq.Repo.LeadsRepo;
import com.org.CRMUniq.model.Leads;

import jakarta.servlet.http.HttpServletResponse;

@Service
public class CsvFileDownloadService {
	
	@Autowired
    private LeadsRepo leadsRepository;
	
	// Download Leads to CSV
    public void downloadLeads(HttpServletResponse response) throws IOException {
        List<Leads> leads = leadsRepository.findAll();

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=leads.csv");

        try (PrintWriter writer = response.getWriter()) {
            // Write header
            writer.println("LID,Lead Name,Lead Status,Email,Contact No,Lead Owner,Lead Owner ID,Lead Owner Role,Looking For,Lead Source,Preferred Location,Notes,Remainder,Lead Age,Begin Date,End Date");

            // Write data
            for (Leads lead : leads) {
                writer.printf(
                    "%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s%n",
                    lead.getLID(),
                    lead.getLeadName(),
                    lead.getLeadStatus(),
                    lead.getEmail(),
                    lead.getContactNo(),
                    lead.getLeadOwner(),
                    lead.getLeadOwnerId(),
                    lead.getLeadOwnerRole(),
                    lead.getLookingFor(),
                    lead.getLeadSource(),
                    lead.getPreferedLocation(),
                    lead.getNotes(),
                    lead.getRemainder(),
                    lead.getLeadAge(),
                    new SimpleDateFormat("yyyy-MM-dd").format(lead.getBeginDate()),
                    new SimpleDateFormat("yyyy-MM-dd").format(lead.getEndDate())
                );
            }
        }
    }

}
