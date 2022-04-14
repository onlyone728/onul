package com.onul.community.model;

import com.onul.comment.model.Comment;
import com.onul.user.model.User;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class CommentView {

	private Comment comment;
	private User user;
}
