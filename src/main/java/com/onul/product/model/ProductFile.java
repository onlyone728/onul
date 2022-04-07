package com.onul.product.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductFile {

	private int productId;
	private String imagePath;
	private Date createdAt;
	private Date updatedAt;
}
