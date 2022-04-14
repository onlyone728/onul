package com.onul.community.model;

import java.util.List;

import com.onul.photo.model.Photo;
import com.onul.user.model.User;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PhotoView {
	private Photo photo;
	private User user;
	private List<Photo> photoList;
	private List<CommentView> commentList;
	private int followCount;
	private boolean isFollow;
	private int likeCount;
	private boolean filledLike;
	
}
