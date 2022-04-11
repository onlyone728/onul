package com.onul.knowhowPost.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Knowhow {

	private int id;
	private int userId;
	private String nickName;
	private String profileImage;
	private String postType;
	private Category category;
	private String subject;
	private String content;
	private String coverImage;
	private int hit;
	private Date createdAt;
	private Date updatedAt;
}
