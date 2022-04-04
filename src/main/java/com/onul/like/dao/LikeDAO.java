package com.onul.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.onul.like.model.Like;

@Repository
public interface LikeDAO {

	public int selectLikeCountByPostIdOrUserId(
			@Param("postId") int postId, 
			@Param("postType") String postType,
			@Param("userId") Integer userId);
	
	public int selectLikeCountByPostId(
			@Param("postId") int postId, 
			@Param("postType") String postType);
	
	public void insertLike(
			@Param("userId") int userId,
			@Param("nickName") String nickName,
			@Param("postType") String postType,
			@Param("postId") int postId);
	
	public List<Like> selectLikeListByUserId (int userId);
	
	public void deleteLikeByPostIdUserId(
			@Param("postId") int postId,
			@Param("postType") String postType,
			@Param("userId") int userId);
	
	public void deleteLikeByPostIdPostType(
			@Param("postId") int postId, 
			@Param("postType") String postType);
}
