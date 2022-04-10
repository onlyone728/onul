package com.onul.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.comment.follow.bo.FollowBO;
import com.onul.community.bo.FollowViewBO;
import com.onul.community.bo.IntroduceHouseViewBO;
import com.onul.community.bo.KnowhowViewBO;
import com.onul.community.bo.PhotoViewBO;
import com.onul.community.model.FollowView;
import com.onul.community.model.IntroduceHouseView;
import com.onul.community.model.KnowhowView;
import com.onul.community.model.PhotoView;
import com.onul.like.bo.LikeBO;
import com.onul.like.model.Like;
import com.onul.user.dao.UserDAO;
import com.onul.user.model.User;
import com.onul.user.model.UserView;

@Service
public class UserViewBO {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private PhotoViewBO photoBO; 
	
	@Autowired
	private IntroduceHouseViewBO introduceBO;
	
	@Autowired 
	private KnowhowViewBO knowhowBO;
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private FollowViewBO followvBO;
	
	@Autowired
	private FollowBO followBO;
	
	public UserView generateUserView(
			@RequestParam("uId") int uId,
			@RequestParam(value="userId", required=false) Integer userId) {
		UserView userView = new UserView();
		User user = userDAO.selectUserById(uId);
		userView.setUser(user);
		
		List<PhotoView> photoList = photoBO.generatePhotoViewList(null, uId);
		userView.setPhotoList(photoList);
		
		List<IntroduceHouseView> houseList = introduceBO.generateIntroduceHouseList(uId);
		userView.setHouseList(houseList);
		
		List<KnowhowView> knowhowList = knowhowBO.generateKnowhowList(null, uId);
		userView.setKnowhowList(knowhowList);
		
		List<Like> likeList = likeBO.getLikeListByUserId(uId);
		userView.setLikeList(likeList);
		
		List<FollowView> followerList = followvBO.generateFollowerList(uId);
		userView.setFollowerList(followerList);
		
		List<FollowView> followingList = followvBO.generateFollowingList(uId);
		userView.setFollowingList(followingList);
		
		boolean isFollow = followBO.existFollow(uId, userId);
		userView.setFollow(isFollow);
		
		int followCount = followBO.getFollowCountByUserId(uId);
		int followedCount = followBO.getFollowCountByFollowId(uId);
		userView.setFollowCount(followCount);
		userView.setFollowedCount(followedCount);
		
		return userView;
	}
}
