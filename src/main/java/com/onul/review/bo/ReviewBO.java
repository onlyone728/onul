package com.onul.review.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onul.review.dao.ReviewDAO;
import com.onul.review.model.Review;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewDAO reviewDAO;

	public List<Review> getReviewListByProductId(int productId) {
		return reviewDAO.selectReviewListByProductId(productId);
	}
}
