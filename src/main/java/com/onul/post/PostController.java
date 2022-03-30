package com.onul.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.photo.bo.PhotoBO;
import com.onul.photo.model.Photo;

@Controller
public class PostController {

	@Autowired
	private PhotoBO photoBO;
	
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

	@RequestMapping("/post/knowhow_create_view")
	public String create(Model model) {
		model.addAttribute("viewPath", "post/create_knowhow");
		return "template/post-layout";
	}
	
	@RequestMapping("/post/photo_update_view")
	public String updatePhoto(
			@RequestParam("postId") int postId,
			Model model) {
		
		// DB 가져오기
		Photo photo = photoBO.getPhotoById(postId);
		
		model.addAttribute("photo", photo);
		model.addAttribute("viewPath", "post/update_photo");
		return "template/post-layout";
	}
	
}
