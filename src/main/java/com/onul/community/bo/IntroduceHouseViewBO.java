package com.onul.community.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.comment.follow.bo.FollowBO;
import com.onul.community.model.CommentView;
import com.onul.community.model.IntroduceHouseView;
import com.onul.introduceHousePost.bo.IntroduceHouseBO;
import com.onul.introduceHousePost.model.IntroduceFiles;
import com.onul.introduceHousePost.model.IntroduceHouse;
import com.onul.like.bo.LikeBO;
import com.onul.user.bo.UserBO;
import com.onul.user.model.User;

@Service
public class IntroduceHouseViewBO {
	
	@Autowired
	private IntroduceHouseBO introduceBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentViewBO commentBO;
	
	@Autowired
	private FollowBO followBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public List<IntroduceHouseView> generateIntroduceHouseList(
			@RequestParam(value = "userId", required = false) Integer uId,
			@RequestParam(value="keyword", required=false) String keyword) {
		
		List<IntroduceHouseView> introduceHouseViewList = new ArrayList<>();
		List<IntroduceHouse> introduceHouseList = new ArrayList<>();
		
		if (uId != null) {
			introduceHouseList = introduceBO.getIntroduceHouseListByUserId(uId);
		} else if (keyword != null) {
			introduceHouseList = introduceBO.getIntroduceHouseListByKeyword(keyword);
		} else {
			introduceHouseList = introduceBO.getIntroduceHouseList();
		}
		
		for (IntroduceHouse house : introduceHouseList) {
			IntroduceHouseView houseView = new IntroduceHouseView();
			houseView.setHouse(house);
			
			int postId = house.getId();
			int writerId = house.getUserId();
			String postType = house.getPostType();
			
			List<IntroduceFiles> fileList = introduceBO.getIntroduceFilesByPostId(postId);
			houseView.setFileList(fileList);
			
			User user = userBO.getUserById(writerId);
			houseView.setUser(user);
			
			List<IntroduceHouse> writerHouseList = introduceBO.getIntroduceHouseListByUserId(writerId);
			houseView.setHouseList(writerHouseList);
			
			List<CommentView> commentList = commentBO.generateCommentViewList(postId, postType);
			houseView.setCommentList(commentList);
			
			int followCount = followBO.getFollowCountByFollowId(writerId);
			houseView.setFollowCount(followCount);
			
			boolean isFollow = followBO.existFollow(uId, writerId);
			houseView.setFollow(isFollow);
			
			int likeCount = likeBO.getLikeCountByPostId(postId, postType);
			houseView.setLikeCount(likeCount);
			
			boolean filledLike = likeBO.existLike(postId, postType, uId);
			houseView.setFilledLike(filledLike);
			
			
			introduceHouseViewList.add(houseView);		
		}
		return introduceHouseViewList;
	}
	
	public List<IntroduceHouseView> generateIntroduceHouseListByHit(
			@RequestParam(value = "userId", required = false) Integer uId) {
		
		List<IntroduceHouseView> introduceHouseViewList = new ArrayList<>();
		List<IntroduceHouse> introduceHouseList = new ArrayList<>();
		
		if (uId != null) {
			introduceHouseList = introduceBO.getIntroduceHouseListByUserId(uId);
		} else {
			introduceHouseList = introduceBO.getIntroduceListOrderByHit();
		}
		
		for (IntroduceHouse house : introduceHouseList) {
			IntroduceHouseView houseView = new IntroduceHouseView();
			houseView.setHouse(house);
			
			int postId = house.getId();
			int writerId = house.getUserId();
			String postType = house.getPostType();
			
			List<IntroduceFiles> fileList = introduceBO.getIntroduceFilesByPostId(postId);
			houseView.setFileList(fileList);
			
			User user = userBO.getUserById(writerId);
			houseView.setUser(user);
			
			List<IntroduceHouse> writerHouseList = introduceBO.getIntroduceHouseListByUserId(writerId);
			houseView.setHouseList(writerHouseList);
			
			List<CommentView> commentList = commentBO.generateCommentViewList(postId, postType);
			houseView.setCommentList(commentList);
			
			int followCount = followBO.getFollowCountByFollowId(writerId);
			houseView.setFollowCount(followCount);
			
			boolean isFollow = followBO.existFollow(uId, writerId);
			houseView.setFollow(isFollow);
			
			int likeCount = likeBO.getLikeCountByPostId(postId, postType);
			houseView.setLikeCount(likeCount);
			
			boolean filledLike = likeBO.existLike(postId, postType, uId);
			houseView.setFilledLike(filledLike);
			
			
			introduceHouseViewList.add(houseView);		
		}
		return introduceHouseViewList;
	}

	public IntroduceHouseView generateIntroduceHouseView(
			@RequestParam("postId") int postId,
			@RequestParam(value="userId", required=false) Integer uId) {
		IntroduceHouseView houseView = new IntroduceHouseView();
		IntroduceHouse introduceHouse =  introduceBO.getIntroduceHouseById(postId);
		houseView.setHouse(introduceHouse);
		
		int writerId = introduceHouse.getUserId();
		String postType = introduceHouse.getPostType();
		
		List<IntroduceFiles> fileList = introduceBO.getIntroduceFilesByPostId(postId);
		houseView.setFileList(fileList);
		
		User user = userBO.getUserById(writerId);
		houseView.setUser(user);
		
		List<IntroduceHouse> houseList = introduceBO.getIntroduceHouseListByUserId(writerId);
		houseView.setHouseList(houseList);
		
		List<CommentView> commentList = commentBO.generateCommentViewList(postId, postType);
		houseView.setCommentList(commentList);
		
		int followCount = followBO.getFollowCountByFollowId(writerId);
		houseView.setFollowCount(followCount);
		
		boolean isFollow = followBO.existFollow(uId, writerId);
		houseView.setFollow(isFollow);
		
		int likeCount = likeBO.getLikeCountByPostId(postId, postType);
		houseView.setLikeCount(likeCount);
		
		boolean filledLike = likeBO.existLike(postId, postType, uId);
		houseView.setFilledLike(filledLike);
		
		return houseView;
	}
}
