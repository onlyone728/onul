package com.onul.store;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {

	@RequestMapping("/store/sign_out")
	public String signOut(HttpSession session) {
		session.removeAttribute("storeId");
		session.removeAttribute("storeImage");
		
		return "redirect:/store/sign_in_view";
	}
	
}
