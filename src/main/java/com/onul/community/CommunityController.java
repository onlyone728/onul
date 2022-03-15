package com.onul.community;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@RequestMapping("/main")
	public String communityView(Model model) {
		model.addAttribute("viewPath", "community/main");
		return "template/layout";
	}
}
