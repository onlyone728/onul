package com.onul.user.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter	@Setter
public class User {

	private int id;
	private String loginId;
	private String password;
	private String nickName;
	private String profileImage;
	private String introduce;
	private String name;
	private String email;
	private Date createdAt;
	private Date updatedAt;
}
