package com.onul.introduceHousePost.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class IntroduceFiles {

	private int postId;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
	
}