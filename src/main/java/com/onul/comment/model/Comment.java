package com.onul.comment.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Comment {

	private int id;
	private int userId;
	private String nickName;
	private String profileImage;
	private String postType;
	private int postId;
	private String content;
	private Date createdAt;
	private Date updatedAt;
}
