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
import com.onul.knowhowPost.model.Category;
import com.onul.photo.model.Space;
import com.onul.shop.bo.ProductViewBO;
import com.onul.shop.model.ProductView;

@Controller
public class CommunityController {
	
	@Autowired
	private PhotoViewBO photoViewBO;
	
	@Autowired
	private IntroduceHouseViewBO introduceBO;
	
	@Autowired
	private KnowhowViewBO knowhowBO;
	
	@Autowired
	private ProductViewBO productBO;
	
	@RequestMapping("/community")
	public String communityView(
			Model model) {
		
		// post 가져오기
		List<PhotoView> photoViewList = photoViewBO.generatePhotoViewList(null, null, null);
		List<IntroduceHouseView> houseList = introduceBO.generateIntroduceHouseList(null, null);
		List<KnowhowView> knowhowList = knowhowBO.generateKnowhowList(null, null, null);
		IntroduceHouseView mainPost = introduceBO.generateIntroduceHouseView(16, null);
		KnowhowView subPost = knowhowBO.generateKnowhowView(12, null);
		
		// product 가져오기
		List<ProductView> productList = productBO.generateProductViewList(null);
		
		model.addAttribute("mainPost", mainPost);
		model.addAttribute("subPost", subPost);
		model.addAttribute("productList", productList);
		model.addAttribute("photoList", photoViewList);
		model.addAttribute("houseList", houseList);
		model.addAttribute("knowhowList", knowhowList);
		model.addAttribute("viewPath", "community/main_v1");
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
			@RequestParam(value="space", required=false) Space space,
			Model model) {
				
		// DB select
		List<PhotoView> photoList = photoViewBO.generatePhotoViewList(space, null, null);
		
		model.addAttribute("postList", photoList);
		model.addAttribute("viewPath", "community/photo_list");
		return "template/layout";
	}
	
	@RequestMapping("/community/introduce_view")
	public String introduceListView(
			Model model) {
		// DB select
		List<IntroduceHouseView> houseList = introduceBO.generateIntroduceHouseList(null, null);
		
		model.addAttribute("houseList", houseList);
		model.addAttribute("viewPath", "community/introduceHouse_list");
		return "template/layout";
	}
	
	@RequestMapping("/community/knowhow_view")
	public String knowhowListView(
			@RequestParam(value="category", required=false) Category category,
			Model model) {
		// DB select
		List<KnowhowView> knowhowList = knowhowBO.generateKnowhowList(category, null, null);
			
		model.addAttribute("postList", knowhowList);
		model.addAttribute("viewPath", "community/knowhow_view");
		return "template/layout";
	}
	
	@RequestMapping("/community/search")
	public String searchView(
			@RequestParam("keyword") String keyword,
			Model model) {
		// postType별 List 생성
		List<PhotoView> photoList = photoViewBO.generatePhotoViewList(null, null, keyword);
		List<IntroduceHouseView> houseList = introduceBO.generateIntroduceHouseList(null, keyword);	
		List<KnowhowView> knowhowList = knowhowBO.generateKnowhowList(null, null, keyword);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("knowhowList", knowhowList);
		model.addAttribute("houseList", houseList);
		model.addAttribute("photoList", photoList);
		model.addAttribute("viewPath", "community/search");
		return "template/layout";
	}
}
