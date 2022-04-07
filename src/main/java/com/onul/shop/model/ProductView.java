package com.onul.shop.model;

import java.util.List;

import com.onul.order.model.Order;
import com.onul.product.model.Product;
import com.onul.product.model.ProductFile;
import com.onul.qna.model.Qna;
import com.onul.review.model.Review;
import com.onul.store.model.Store;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ProductView {

	private Product product;
	private List<ProductFile> files;
	private Store store;
	private List<Order> orderList;
	private int orderCount;
	private List<Review> reviewList;
	private List<Qna> qnaList;
}
