package com.onul.knowhowPost.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class KnowhowFiles {

	private int postId;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
}
