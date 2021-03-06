package com.onul.like.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onul.like.dao.LikeDAO;
import com.onul.like.model.Like;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;

	public void like(int userId, String nickName, String postType, int postId) {
		boolean existLike = existLike(postId, postType, userId);
		if (existLike) {
			likeDAO.deleteLikeByPostIdUserId(postId, postType, userId);
		} else {
			likeDAO.insertLike(userId, nickName, postType, postId);
		}
	}
	
	public boolean existLike(int postId, String postType, Integer userId) {
		// 비로그인 상태면 세팅된 좋아요는 없다.
		if (userId == null) {
			return false;
		}
		
		int count = likeDAO.selectLikeCountByPostIdOrUserId(postId, postType, userId);
		return count > 0? true : false;
	}
	
	public List<Like> getLikeListByUserId (int userId) {
		return likeDAO.selectLikeListByUserId(userId);
	}
	
	// like count
	public int getLikeCountByPostId(int postId, String postType) {
		return likeDAO.selectLikeCountByPostId(postId, postType);
	}
	
	public void deleteLikeByPostIdPostType(int postId, String postType) {
		likeDAO.deleteLikeByPostIdPostType(postId, postType);
	}
	
	public void deleteLikeByPostIdUserId(int postId, String postType, int userId) {
		likeDAO.deleteLikeByPostIdUserId(postId, postType, userId);
	}
}
