package com.onul.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onul.comment.dao.CommentDAO;
import com.onul.comment.model.Comment;

@Service
public class CommentBO {

	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int userId, String nickName, String profileImage, String postType, int postId, String content) {
		return commentDAO.addComment(userId, nickName, profileImage, postType, postId, content);
	}
	
	public List<Comment> getCommentListByPostTypeAndPostId(String postType, int postId) {
		return commentDAO.selectCommentListByPostTypeAndPostId(postType, postId);
	}
	
	public int commentCount(String postType, int postId) {
		return commentDAO.commentCount(postType, postId);
	}
	
	public void deleteCommentByPostIdPostType(int postId, String postType) {
		commentDAO.deleteCommentByPostIdPostType(postId, postType);
	}
}
