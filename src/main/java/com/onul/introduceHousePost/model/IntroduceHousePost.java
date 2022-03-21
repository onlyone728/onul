package com.onul.introduceHousePost.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class IntroduceHousePost {

	private int id;
	private int userId;
	private String nickName;
	private String type;
	private String area;
	private String familyType;
	private String fieldOfWork;
	private String worker;
	private String subject;
	private String content;
	private String coverImage;
	private String imagePath;
	private int hit;
	private Date createdAt;
	private Date updatedAt;
}
