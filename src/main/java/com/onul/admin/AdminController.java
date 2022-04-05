package com.onul.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("/admin")
	public String signInView(Model model) {
		model.addAttribute("viewPath", "admin/signIn");
		return "template/user-layout";
	}
	
	@RequestMapping("/admin/summary")
	public String adminSummaryView(Model model) {
		model.addAttribute("viewPath", "admin/main");
		return "template/admin-layout";
	}
	
	@RequestMapping("/admin/sign_up_view")
	public String adminSignUpView(Model model) {
		model.addAttribute("viewPath", "admin/signUp");
		return "template/user-layout";
	}
}
