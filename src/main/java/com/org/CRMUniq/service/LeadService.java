package com.org.CRMUniq.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.CRMUniq.Repo.LeadsRepo;
import com.org.CRMUniq.model.Leads;

@Service
public class LeadService {

	
	
	@Autowired
	LeadsRepo leadrepo;
	
	public Leads AddLead(Leads lead) {
		return leadrepo.save(lead);
	}

	public List<Leads> AddAllLead(List<Leads> leads) {
		return leadrepo.saveAll(leads);
	}

	public List<Leads> getAllLeads() {
		
		List<Leads> leads=leadrepo.findAll();
		
		leads.forEach(l->{
			
			l.setLeadAge(CalculateDateDifference( l.getBeginDate(), new Date()));
			
		});
		
		return AddAllLead(leads);
	}

	public List<Leads> getLeadsByIds(List<Long> leadID) {
		return leadrepo.findAllById(leadID);
	}
	
	
	
	public Long CalculateDateDifference(Date beginDate,Date currentdate) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			beginDate = dateFormat.parse(dateFormat.format(beginDate));
			currentdate = dateFormat.parse(dateFormat.format(currentdate));

		} catch (ParseException e) {
			e.printStackTrace();
		}
		long diffInMillies = Math.abs(currentdate.getTime() - beginDate.getTime());
		long diffInDays = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
		
		return diffInDays;
	}

	public List<Leads> FindByleadOwnerId(Long id) {
		List<Leads> leads=leadrepo.findByleadOwnerId(id);
		return leads;
	}
}
