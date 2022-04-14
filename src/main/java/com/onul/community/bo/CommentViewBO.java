package com.onul.community.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.comment.bo.CommentBO;
import com.onul.comment.model.Comment;
import com.onul.community.model.CommentView;
import com.onul.user.bo.UserBO;
import com.onul.user.model.User;

@Service
public class CommentViewBO {
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private UserBO userBO;
	
	public List<CommentView> generateCommentViewList(
			@RequestParam("postId") int postId,
			@RequestParam("postType") String postType) {
		List<CommentView> commentViewList = new ArrayList<>();
		List<Comment> commentList = commentBO.getCommentListByPostTypeAndPostId(postType, postId);
		
		for (Comment comment:commentList) {
			CommentView commentView = new CommentView();
			commentView.setComment(comment);
			
			int userId = comment.getUserId();
			User user = userBO.getUserById(userId);
			
			commentView.setUser(user);
			commentViewList.add(commentView);
		}
		return commentViewList;
	}

	public CommentView generateCommentView(
			@RequestParam("id") int id) {
		CommentView commentView = new CommentView();
		Comment comment = commentBO.getCommentById(id);
		commentView.setComment(comment);
		int userId = comment.getUserId();
		User user = userBO.getUserById(userId);
		commentView.setUser(user);
		
		return commentView;
	}
}
