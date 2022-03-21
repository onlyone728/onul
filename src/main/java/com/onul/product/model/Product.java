package com.onul.product.model;

import java.util.Date;

import com.onul.product.ProductCategory;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Product {
	
	private int id;
	private String productName;
	private  int storeId;
	private  String storeName;
	private int price;
	private ProductCategory productCategory;
	private String delivery;
	private String origin;
	private String subject;
	private String content;
	private String imagePath;
	private String thumbNail;
	private String salesType;
	private int countSales;
	private Date createdAt;
	private Date updatedAt;
}
