package com.onul.review.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.onul.review.model.Review;

@Repository
public interface ReviewDAO {

	public List<Review> selectReviewListByProductId(int productId);
	
	public int getPointAverage(int productId);
}
