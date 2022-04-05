package com.onul.store.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Store {

	private int id;
	private String loginId;
	private String password;
	private String storeName;
	private String storeImage;
	private int businessNumber;
	private String name;
	private int phoneNumber;
	private String email;
	private Date createdAt;
	private Date updatedAt;
}
