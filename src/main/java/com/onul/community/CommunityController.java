package com.onul.community;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.comment.bo.CommentBO;
import com.onul.comment.follow.bo.FollowBO;
import com.onul.comment.model.Comment;
import com.onul.introduceHousePost.bo.IntroduceHouseBO;
import com.onul.introduceHousePost.model.IntroduceHouse;
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
	private CommentBO commentBO;
	
	@Autowired
	private FollowBO followBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@RequestMapping("/community")
	public String communityView(
			Model model,
			HttpServletRequest request) {
		
//		// post 가져오기
		List<Photo> photoList = photoBO.getphotoListOrderByHit();
		List<IntroduceHouse> houseList = introduceBO.getIntroduceListOrderByHit();
//		List<Knowhow> knowhowList = knowhowBO.getKnowhowOrderByHit();
//		
//		// product 가져오기
//		
		// session 가져오기
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		String userProfileImage = (String) session.getAttribute("userProfileImage");
		String userNickName = (String) session.getAttribute("userNickName");
		
		model.addAttribute("photo", photoList);
		model.addAttribute("house", houseList);
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
				
		// comment 가져오기
		List<Comment> commentList = commentBO.getCommentListByPostTypeAndPostId("photo", postId);
		// commentCount
		int commentCount = commentBO.commentCount("photo", postId);
		
		// BO -> DB select : photo & userInfo
		Photo photo = photoBO.getPhotoById(postId);
		
		// follow 가져오기
		int followCount = followBO.getFollowCountByFollowId(photo.getUserId());
		
		int userId = photo.getUserId();
		List<Photo> photoList = photoBO.getPhotoListByUserId(userId);
		UserInfo userInfo = userInfoBO.getUserInfoByUserId(userId);
		
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("comments", commentList);
		model.addAttribute("followCount", followCount);
		model.addAttribute("like", likeCount);
		model.addAttribute("userInfo", userInfo);
		model.addAttribute("photoList", photoList);
		model.addAttribute("photo", photo);
		model.addAttribute("viewPath", "post/detail_photo");
		
		return "template/layout";
	}
	
	@RequestMapping("/community/introduce_detail_view")
	public String detailIntroduce(
			@RequestParam("postId") int postId,
			Model model) {
		// hit 증가
		photoBO.addHit(postId);
		
		// like 가져오기
		int likeCount = likeBO.getLikeCountByPostId(postId, "introduceHouse");
		
		// comment 가져오기
		List<Comment> commentList = commentBO.getCommentListByPostTypeAndPostId("introduceHouse", postId);
		// commentCount
		int commentCount = commentBO.commentCount("introduceHouse", postId);
		
		// DB select
		IntroduceHouse house = introduceBO.getIntroduceHouseById(postId); 
		
		// follow 가져오기
		int followCount = followBO.getFollowCountByFollowId(house.getUserId());
		
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("followCount", followCount);
		model.addAttribute("comments", commentList);
		model.addAttribute("post", house);
		model.addAttribute("like", likeCount);
		model.addAttribute("viewPath", "post/detail_introduce");
		
		return "template/layout";
	}
}
