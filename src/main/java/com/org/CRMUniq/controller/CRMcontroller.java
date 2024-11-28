package com.org.CRMUniq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.org.CRMUniq.model.AllUsers;
import com.org.CRMUniq.model.Leads;
import com.org.CRMUniq.model.Manager;
import com.org.CRMUniq.model.SalesUser;
import com.org.CRMUniq.service.AllUserService;
import com.org.CRMUniq.service.LeadService;

@RestController
@RequestMapping("/crm")
public class CRMcontroller {

	@Autowired
	AllUserService userService;
	@Autowired
	LeadService leadService;

	@PostMapping("/add")
	public AllUsers add(@RequestBody AllUsers user) {

		return userService.addusers(user);
	}

	@PostMapping("/addMulti")
	public List<AllUsers> addMulti(@RequestBody List<AllUsers> users) {
		return userService.addMultipleUsers(users);
	}

	@GetMapping("/getByrole/{role}")
	private List<AllUsers> getByRole(@PathVariable String role) {
		return userService.GetByRole(role);

	}

	@PostMapping("/addManager")
	public Manager addManager(@RequestBody Manager manager) {
		return manager;
	}

	// demo purpose
	@GetMapping("/allocate/{MID}/{SuID}")
	private SalesUser allo(@PathVariable Long MID, @PathVariable Long SuID) {
		return userService.allocateSUtoManager(MID, SuID);

	}

	// adding lead
	@PostMapping("/addLead")
	public Leads addLead(@RequestBody Leads lead) {
		return leadService.AddLead(lead);

	}
	@PostMapping("/addMultipleLeads")
	public List<Leads> addMultipleLead(@RequestBody List<Leads> leads) {
		return leadService.AddAllLead(leads);

	}

	// allocate 
	
	
}
