package com.onul.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping("/sign_in_view")
	public String signInView(Model model) {
		
		model.addAttribute("viewPath", "user/signIn");
		return "template/user-layout";
	}
	
	@RequestMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("viewPath", "user/signUp");
		return "template/user-layout";
	}
}
