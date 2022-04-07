package com.onul.order.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Order {

	private int id;
	private int userId;
	private String userName;
	private int storeId;
	private int productId;
	private int count;
	private int price;
	private String progress;
	private Date createdAt;
	private Date updatedAt;
}
