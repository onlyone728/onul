package com.onul.photo.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Photo {

	private int id;
	private int userId;
	private String nickName;
	private String postType;
	private String content;
	private String imagePath;
	private int hit;
	private Date createdAt;
	private Date updatedAt;
}
