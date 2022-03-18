package com.onul.user.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter	@Setter
public class User {

	private int id;
	private String loginId;
	private String password;
	private String nickName;
	private MultipartFile profileImage;
	private String name;
	private String email;
	private Date createdAt;
	private Date updatedAt;
}
