package com.onul.community.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.comment.follow.bo.FollowBO;
import com.onul.comment.follow.model.Follow;
import com.onul.community.model.FollowView;
import com.onul.user.bo.UserBO;
import com.onul.user.model.User;

@Service
public class FollowViewBO {
	
	@Autowired
	private FollowBO followBO;
	
	@Autowired
	private UserBO userBO;

	public List<FollowView> generateFollowerList(
			@RequestParam("userId") int uId) {
		List<FollowView> followViewList = new ArrayList<>();
		List<Follow> followList = new ArrayList<>();
		
		followList = followBO.getFollowListByFollowId(uId);
		
		for(Follow follow:followList) {
			FollowView followView = new FollowView();
			followView.setFollow(follow);
			int userId = follow.getUserId();
			
			User user = userBO.getUserById(userId);
			followView.setUser(user);
			
			User follower = userBO.getUserById(uId);
			followView.setFollower(follower);
			
			followViewList.add(followView);
		}
		return followViewList;
	}
	
	public List<FollowView> generateFollowingList(
			@RequestParam("userId") int userId) {
		List<FollowView> followViewList = new ArrayList<>();
		List<Follow> followList = new ArrayList<>();
		
		followList = followBO.getFollowListByUserId(userId);
		
		for(Follow follow:followList) {
			FollowView followView = new FollowView();
			followView.setFollow(follow);
			int followId = follow.getFollowId();
			
			User user = userBO.getUserById(userId);
			followView.setUser(user);
			
			User follower = userBO.getUserById(followId);
			followView.setFollower(follower);
			
			followViewList.add(followView);
		}
		return followViewList;
	}
}
