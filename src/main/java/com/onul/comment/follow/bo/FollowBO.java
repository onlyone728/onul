package com.onul.comment.follow.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onul.comment.follow.dao.FollowDAO;

@Service
public class FollowBO {
	
	@Autowired
	private FollowDAO followDAO;

	public int addFollow(int userId, int followId) {
		boolean follow = existFollow(userId, followId);
		
		if (follow) {	// follow 있음
			followDAO.deleteFollowByUserIdAndFollowId(userId, followId);
			return 0;
		} else {	// follow 없음
			return followDAO.insertFollow(userId, followId);
		}
	}
	
	public boolean existFollow(Integer userId, int followId) {
		if (userId == null) {
			return false;
		}
		
		int count = followDAO.selectFollowCountByUserIdAndFollowId(userId, followId);
		
		return count > 0 ? true:false;
	}
	
	public int getFollowCountByUserIdAndFollowId(int userId, int followId) {
		return followDAO.selectFollowCountByUserIdAndFollowId(userId, followId);
	}
	
	public void deleteFollowByUserIdAndFollowId(int userId, int followId) {
		followDAO.deleteFollowByUserIdAndFollowId(userId, followId);
	}
	
	public int getFollowCountByUserId(Integer userId) {
		if (userId == null) {
			return 0;
		} else {
			return followDAO.selectFollowCountByUserId(userId);
		}
	}
	
	public int getFollowCountByFollowId(int followId) {
		return followDAO.selectFollowCountByFollowId(followId);
	}
}
