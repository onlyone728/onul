package com.onul.qna.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Qna {

	private int id;
	private int userId;
	private String nickName;
	private int storeId;
	private int productId;
	private String subject;
	private String content;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
}
