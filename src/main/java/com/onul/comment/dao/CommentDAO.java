package com.onul.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.onul.comment.model.Comment;

@Repository
public interface CommentDAO {

	public int addComment(
			@Param("userId") int userId, 
			@Param("nickName") String nickName, 
			@Param("profileImage") String profileImage,
			@Param("postType") String postType, 
			@Param("postId") int postId, 
			@Param("content") String content);
	
	public List<Comment> selectCommentListByPostTypeAndPostId(
			@Param("postType") String postType, 
			@Param("postId") int postId);
	
	public int commentCount(
			@Param("postType") String postType, 
			@Param("postId") int postId); 
	
	public void deleteCommentByPostIdPostType(
			@Param("postId") int postId, 
			@Param("postType") String postType);
	
	public Comment selectCommentById(int id);
}
