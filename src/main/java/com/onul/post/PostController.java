package com.onul.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.introduceHousePost.bo.IntroduceHouseBO;
import com.onul.introduceHousePost.model.IntroduceFiles;
import com.onul.introduceHousePost.model.IntroduceHouse;
import com.onul.knowhowPost.bo.KnowhowBO;
import com.onul.knowhowPost.model.Knowhow;
import com.onul.knowhowPost.model.KnowhowFiles;
import com.onul.photo.bo.PhotoBO;
import com.onul.photo.model.Photo;

@Controller
public class PostController {

	@Autowired
	private PhotoBO photoBO;
	
	@Autowired
	private IntroduceHouseBO houseBO;
	
	@Autowired
	private KnowhowBO knowhowBO;
	
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
	
	@RequestMapping("/post/house_update_view")
	public String updateHouse(
			@RequestParam("postId") int postId,
			Model model) {
		
		IntroduceHouse house = houseBO.getIntroduceHouseById(postId);
		List<IntroduceFiles> fileList = houseBO.getIntroduceFilesByPostId(postId);
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("house", house);
		model.addAttribute("viewPath", "post/update_house");
		return "template/post-layout";
	}
	
	@RequestMapping("/post/knowhow_update_view")
	public String updateKnowhow(
			@RequestParam("postId") int postId,
			Model model) {
		
		Knowhow knowhow = knowhowBO.getKnowhowById(postId);
		List<KnowhowFiles> fileList = knowhowBO.getKnowhowFilesListByPostId(postId);
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("knowhow", knowhow);
		model.addAttribute("viewPath", "post/update_knowhow");
		return "template/post-layout";
	}
}
