package com.onul.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	@RequestMapping("/user/sign_in_view")
	public String signInView(Model model) {
		
		model.addAttribute("viewPath", "user/signIn");
		return "template/user-layout";
	}
	
	@RequestMapping("/user/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("viewPath", "user/signUp");
		return "template/user-layout";
	}
	
	@RequestMapping("/user/sign_out")
	public String signOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		session.removeAttribute("userNickName");
		session.removeAttribute("userImage");
		
		return "redirect:/user/sign_in_view";
	}
	
	
}
