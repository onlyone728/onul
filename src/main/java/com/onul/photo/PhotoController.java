package com.onul.photo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PhotoController {

	@RequestMapping("/post/photo_create_view")
	public String photoCreateView(Model model) {
		
		model.addAttribute("viewPath", "photo/photo_create");
		return "template/layout";
	}
}
