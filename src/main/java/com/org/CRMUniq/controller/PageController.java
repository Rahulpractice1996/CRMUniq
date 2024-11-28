package com.org.CRMUniq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.org.CRMUniq.model.AllUsers;
import com.org.CRMUniq.service.AllUserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PageController {

	@Autowired
	AllUserService userService;

	@PostMapping("/login")
	private String login(@RequestParam("username") String username, @RequestParam("password") String password,
			RedirectAttributes redirectAttributes,HttpSession session) {

		AllUsers User = userService.findByuname(username);
		// System.out.println(User);

		
		if (User!=null &&password.equalsIgnoreCase(User.getPwd())) {
			String uRole=User.getRole();
			session.setAttribute("User", User);
			redirectAttributes.addFlashAttribute("users", User);
			
			switch (uRole.toLowerCase()) {
			case "admin":
				return "redirect:/AdminHome";
			case "manager":
				return "redirect:/managerHome";
			case "teamlead":
				return "redirect:/teamLeadHome";
			case "employee":
				return "redirect:/employeeHome";
			default:
				return "loginSuccess";
			}
		} else {
			redirectAttributes.addFlashAttribute("error", "Invalid credentials, please try again.");
			return "redirect:/";
		}

	}
}
