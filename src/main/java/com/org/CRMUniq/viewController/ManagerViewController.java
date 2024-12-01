package com.org.CRMUniq.viewController;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.org.CRMUniq.model.AllUsers;
import com.org.CRMUniq.model.Leads;
import com.org.CRMUniq.service.AllUserService;
import com.org.CRMUniq.service.LeadService;
import com.org.CRMUniq.service.ManagerService;

import jakarta.servlet.http.HttpSession;


@Controller
public class ManagerViewController {
	
	@Autowired
	LeadService leadService;
	@Autowired
	AllUserService allUserSevice;
	@Autowired
	ManagerService managerservice;
	
	@GetMapping("/Managerhome")
	public String bless(Model model,HttpSession session) {
		AllUsers SessionUser  =(AllUsers) session.getAttribute("User");
		model.addAttribute("manager", SessionUser);
		return"Managerhome";
	}
	
	@GetMapping("/AllLeadsManagerMysmartView")
	public String mysmartView(Model model,HttpSession session) {
		
		AllUsers SessionUser  =(AllUsers) session.getAttribute("User");
		//System.out.println(">>>>>>>>>>>>>"+SessionUser);
		
		List<Long> SalesUsersId=managerservice.getByID(SessionUser.getEID()).getSalesUser().stream().map(s->s.getSUID())
				.collect(Collectors.toList());

		List<Leads> leads = null;
		if(SessionUser!=null && SessionUser.getRole().equalsIgnoreCase("Manager"))
		{
			// this block for managers MyTaskview
			leads = leadService.getAllLeads().stream()
					.filter(l->SalesUsersId.contains(l.getLeadOwnerId()) 
					&& !l.getLeadStatus().equalsIgnoreCase("Enrolled"))
					.filter(l->!l.getLeadStatus().equalsIgnoreCase("rejected"))
					.collect(Collectors.toList()); 	
		}
		
		model.addAttribute("leads", leads);
		List<AllUsers> Managers = allUserSevice.GetByRole("Manager");
		List<AllUsers> SalesUsers = allUserSevice.GetByRole("SalesUser");
		model.addAttribute("Managers", Managers);
		model.addAttribute("SalesUsers", SalesUsers);
		
		return "My Smart View";
	} 
	
	@GetMapping("/leadsBucket") 
	private String leads(Model model, HttpSession session) {
		AllUsers SessionUser  =(AllUsers) session.getAttribute("User");
		
		List<Leads> leads = leadService.getAllLeads().stream().filter(l->l.getLeadOwnerRole().equalsIgnoreCase("Manager")
				&& l.getLeadOwnerId()==SessionUser.getEID()
				&&!l.getLeadStatus().equalsIgnoreCase("rejected")
				&&!l.getLeadStatus().equalsIgnoreCase("Enrolled"))
				.collect(Collectors.toList()); 		
		model.addAttribute("leads", leads);
		
		List<Long> SalesUsersId=managerservice.getByID(SessionUser.getEID()).getSalesUser().stream().map(s->s.getSUID())
				.collect(Collectors.toList());		
	
		List<AllUsers> SalesUsers = allUserSevice.getById(SalesUsersId);
		model.addAttribute("Managers", SessionUser);
		model.addAttribute("SalesUsers", SalesUsers);
		return "MgrLeadsbucket";
	}
}
