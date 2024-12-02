package com.org.CRMUniq.viewController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.org.CRMUniq.model.AllUsers;
import com.org.CRMUniq.model.DAO.CountLeadsByStatus;
import com.org.CRMUniq.service.LeadService;

import jakarta.servlet.http.HttpSession;

@Controller
public class SalesUserViewController {
	
	
	AllUsers SessionUser;
	
	@Autowired
	LeadService leadService;
	
	@GetMapping("/SalesUserHome")
	public String adminHome(Model model,HttpSession session) {
		SessionUser  =(AllUsers) session.getAttribute("User");
		model.addAttribute("users", SessionUser); 
		model.addAttribute("countObj", leadService.countStatus());
		return "SalesUserHome";
	}
	
	@GetMapping("/profile")
	public String profile(Model model,HttpSession session) {
		SessionUser  =(AllUsers) session.getAttribute("User");

		model.addAttribute("user", SessionUser);
		return "profile";
	}
}
