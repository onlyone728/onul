package com.onul.community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.introduceHousePost.bo.IntroduceHouseBO;
import com.onul.knowhowPost.bo.KnowhowBO;
import com.onul.like.bo.LikeBO;
import com.onul.photo.bo.PhotoBO;
import com.onul.photo.model.Photo;
import com.onul.userInfo.bo.UserInfoBO;
import com.onul.userInfo.model.UserInfo;

@Controller
public class CommunityController {
	
	@Autowired
	private UserInfoBO userInfoBO;
	
	@Autowired
	private PhotoBO photoBO;
	
	@Autowired
	private IntroduceHouseBO introduceBO;
	
	@Autowired
	private KnowhowBO knowhowBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@RequestMapping("/community")
	public String communityView(Model model) {
		
//		// post 가져오기
		List<Photo> photoList = photoBO.getphotoListOrderByHit();
//		List<IntroduceHousePost> houseList = introduceBO.getIntroduceListOrderByHit();
//		List<Knowhow> knowhowList = knowhowBO.getKnowhowOrderByHit();
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
			@RequestParam("postId") int postId,
			Model model) {
		// hit 증가
		photoBO.addHit(postId);
		
		// like 가져오기
		int likeCount = likeBO.getLikeCountByPostId(postId, "photo");
				
		// BO -> DB select : photo & userInfo
		Photo photo = photoBO.getPhotoById(postId);
		
		int userId = photo.getUserId();
		List<Photo> photoList = photoBO.getPhotoListByUserId(userId);
		UserInfo userInfo = userInfoBO.getUserInfoByUserId(userId);
		
		model.addAttribute("like", likeCount);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("photoList", photoList);
		model.addAttribute("photo", photo);
		model.addAttribute("viewPath", "post/detail_photo");
		
		return "template/layout";
	}
}
