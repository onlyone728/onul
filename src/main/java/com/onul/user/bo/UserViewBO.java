package com.onul.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onul.comment.follow.bo.FollowBO;
import com.onul.community.bo.IntroduceHouseViewBO;
import com.onul.community.bo.KnowhowViewBO;
import com.onul.community.bo.PhotoViewBO;
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
	private FollowBO followBO;
	
	public UserView generateUserView(int userId) {
		UserView userView = new UserView();
		User user = userDAO.selectUserById(userId);
		userView.setUser(user);
		
		List<PhotoView> photoList = photoBO.generatePhotoViewList(userId);
		userView.setPhotoList(photoList);
		
		List<IntroduceHouseView> houseList = introduceBO.generateIntroduceHouseList(userId);
		userView.setHouseList(houseList);
		
		List<KnowhowView> knowhowList = knowhowBO.generateKnowhowList(null, userId);
		userView.setKnowhowList(knowhowList);
		
		List<Like> likeList = likeBO.getLikeListByUserId(userId);
		userView.setLikeList(likeList);
		
		int followCount = followBO.getFollowCountByUserId(userId);
		int followedCount = followBO.getFollowCountByFollowId(userId);
		userView.setFollowCount(followCount);
		userView.setFollowedCount(followedCount);
		
		return userView;
	}
}
