package com.org.CRMUniq.viewController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.org.CRMUniq.model.AllUsers;

import jakarta.servlet.http.HttpSession;

@Controller
public class SalesUserViewController {
	AllUsers SessionUser;
	@GetMapping("/SalesUserHome")
	public String adminHome(Model model,HttpSession session) {
		SessionUser  =(AllUsers) session.getAttribute("User");
		model.addAttribute("users", SessionUser); 
		return "SalesUserHome";
	}
	
	@GetMapping("/profile")
	public String profile(Model model) {
		model.addAttribute("user", SessionUser);
		return "profile";
	}
}
