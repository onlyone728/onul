package com.onul.userInfo.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class UserInfo {

	private int userId;
	private String nickName;
	private String profileImage;
	private String introduce;
	private Date createdAt;
	private Date updatedAt;
}
