package com.onul.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.introduceHousePost.bo.IntroduceHousePostBO;
import com.onul.knowhowPost.bo.KnowhowPostBO;
import com.onul.photo.bo.PhotoBO;
import com.onul.photo.model.Photo;

@Controller
public class CommunityController {
	
	@Autowired
	private PhotoBO photoBO;
	
	@Autowired
	private IntroduceHousePostBO introduceBO;
	
	@Autowired
	private KnowhowPostBO knowhowBO;
	
	@RequestMapping("/community")
	public String communityView(Model model) {
		
//		// post 가져오기
		List<Photo> photoList = photoBO.getphotoListOrderByHit();
//		List<IntroduceHousePost> houseList = introduceBO.getIntroduceListOrderByHit();
//		List<KnowhowPost> knowhowList = knowhowBO.getKnowhowPostOrderByHit();
//		
//		// product 가져오기
//		
		model.addAttribute("photo", photoList);
//		model.addAttribute("house", houseList);
//		model.addAttribute("knowhowList", knowhowList);
		model.addAttribute("viewPath", "community/main");
		return "template/layout";
	}
	
	@RequestMapping("/community/photo_detail_view")
	public String photoDetailView(
			@RequestParam("postId") String id,
			Model model) {
		// BO -> DB select : photo & userInfo
		Photo photo = photoBO.getPhotoById(id);
		int userId = photo.getUserId();
		List<Photo> photoList = photoBO.getPhotoListByUserId(userId);
		
		model.addAttribute("photo", photo);
		model.addAttribute("viewPath", "photo/photo_detail");
		
		return "template/layout";
	}
}
