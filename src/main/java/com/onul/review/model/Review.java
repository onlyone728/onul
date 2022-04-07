package com.onul.review.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Review {

	private int id;
	private int userId;
	private String nickname;
	private int storeId;
	private int productId;
	private int point;
	private String content;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
}
