package com.onul.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.onul.user.bo.UserViewBO;
import com.onul.user.model.UserView;

@Controller
public class UserController {
	
	@Autowired
	private UserViewBO userViewBO;

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
	
	@RequestMapping("/user/{uId}")
	public String myPage(
			@PathVariable("uId") int uId,
			Model model) {
		// DB 가져오기
		UserView user = userViewBO.generateUserView(uId);
		
		model.addAttribute("user", user);
		model.addAttribute("menuPath", "profile-all");
		model.addAttribute("viewPath", "user/profile");
		return "template/layout";
	}
	@RequestMapping("/user/{uId}/{profileMenu}")
	public String myPageMenu(
			@PathVariable("uId") int uId,
			@PathVariable("profileMenu") String profileMenu,
			Model model) {
		// DB 가져오기
		UserView user = userViewBO.generateUserView(uId);
		
		model.addAttribute("user", user);
		
		if (profileMenu.equals("update") || profileMenu.equals("edit-password")) {
			model.addAttribute("menuPath", "user-" + profileMenu);
			model.addAttribute("viewPath", "user/update");
		} else {
			model.addAttribute("menuPath", "profile-" + profileMenu);
			model.addAttribute("viewPath", "user/profile");
		}
		return "template/layout";
	}
}
