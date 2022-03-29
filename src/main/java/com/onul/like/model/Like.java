package com.onul.like.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Like {

	private int userId;
	private String nickName;
	private String postType;
	private int postId;
	private Date createdAt;
}
