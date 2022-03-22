package com.onul.post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PostController {

	@RequestMapping("/post/photo_create_view")
	public String photoCreateView(Model model) {
		
		model.addAttribute("viewPath", "post/create_photo");
		return "template/post-layout";
	}
	
	@RequestMapping("/post/introduce_create_view")
	public String createIntroduceView(Model model) {
		model.addAttribute("viewPath", "post/create_house");
		return "template/post-layout";
		
	}
}
