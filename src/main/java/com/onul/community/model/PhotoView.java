package com.onul.community.model;

import java.util.List;

import com.onul.comment.model.Comment;
import com.onul.photo.model.Photo;
import com.onul.user.model.User;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PhotoView {
	private Photo photo;
	private User user;
	private List<Photo> photoList;
	private List<Comment> commentList;
	private int commentCount;
	private int followCount;
	private boolean isFollow;
	private int likeCount;
	private boolean filledLike;
	
}
