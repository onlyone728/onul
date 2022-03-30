package com.onul.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.community.bo.IntroduceHouseViewBO;
import com.onul.community.bo.KnowhowViewBO;
import com.onul.community.bo.PhotoViewBO;
import com.onul.community.model.IntroduceHouseView;
import com.onul.community.model.KnowhowView;
import com.onul.community.model.PhotoView;

@Controller
public class CommunityController {
	
	@Autowired
	private PhotoViewBO photoViewBO;
	
	@Autowired
	private IntroduceHouseViewBO introduceBO;
	
	@Autowired
	private KnowhowViewBO knowhowBO;
	
	@RequestMapping("/community")
	public String communityView(
			Model model,
			HttpServletRequest request) {
		// session 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		// post 가져오기
		List<PhotoView> photoViewList = photoViewBO.generatePhotoViewList(userId);
		List<IntroduceHouseView> houseList = introduceBO.generateIntroduceHouseList(userId);
		List<KnowhowView> knowhowList = knowhowBO.generateKnowhowList(userId);
		
		// product 가져오기
		
		
		
		model.addAttribute("photoList", photoViewList);
		model.addAttribute("houseList", houseList);
		model.addAttribute("knowhowList", knowhowList);
		model.addAttribute("viewPath", "community/main");
		return "template/layout";
	}
	
	@RequestMapping("/community/photo_detail_view")
	public String photoDetailView(
			@RequestParam("postId") int postId,
			Model model,
			HttpServletRequest request) {
		
		// session 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		// hit 증가
//		photoBO.addHit(postId);
		
		// BO -> DB select : photo & userInfo
		PhotoView photoView = photoViewBO.photoViewByPostId(postId, userId);
		
		model.addAttribute("photoView", photoView);
		model.addAttribute("viewPath", "community/detail_photo");
		
		return "template/layout";
	}
	
	@RequestMapping("/community/introduce_detail_view")
	public String detailIntroduce(
			@RequestParam("postId") int postId,
			Model model,
			HttpServletRequest request) {
		
		// session 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		// hit 증가
//		introduceBO.addHit(postId);
		
		// DB select 
		IntroduceHouseView house = introduceBO.generateIntroduceHouseView(postId, userId);
		
		model.addAttribute("post", house);
		model.addAttribute("viewPath", "community/detail_introduce");
		
		return "template/layout";
	}
	
	@RequestMapping("/community/knowhow_detail_view")
	public String detailKnowhow(
			@RequestParam("postId") int postId,
			Model model,
			HttpServletRequest request) {
		
		// session 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		
		// hit 증가
//		introduceBO.addHit(postId);
		
		// DB select
		KnowhowView knowhow = knowhowBO.generateKnowhowView(postId, userId);
		
		model.addAttribute("post", knowhow);
		model.addAttribute("viewPath", "community/detail_knowhow");
		return "template/layout";
	}
	
	@RequestMapping("/community/photo_view")
	public String photoListView(
			Model model,
			HttpServletRequest request) {
		// session 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
				
		// DB select
		List<PhotoView> photoList = photoViewBO.generatePhotoViewList(userId);
		
		model.addAttribute("postList", photoList);
		model.addAttribute("viewPath", "community/photo_list");
		return "template/layout";
	}
	
	@RequestMapping("/community/introduce_view")
	public String intoduceListView(
			Model model,
			HttpServletRequest request) {
		// session 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		
		// DB select
		List<IntroduceHouseView> houseList = introduceBO.generateIntroduceHouseList(userId);
		
		model.addAttribute("houseList", houseList);
		model.addAttribute("viewPath", "community/introduceHouse_list");
		return "template/layout";
	}
}
