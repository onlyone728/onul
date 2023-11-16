package com.onul.shop.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.onul.order.bo.OrderBO;
import com.onul.order.model.Order;
import com.onul.product.bo.ProductBO;
import com.onul.product.model.Product;
import com.onul.product.model.ProductFile;
import com.onul.qna.bo.QnaBO;
import com.onul.qna.model.Qna;
import com.onul.review.bo.ReviewBO;
import com.onul.review.model.Review;
import com.onul.shop.model.ProductView;
import com.onul.store.bo.StoreBO;
import com.onul.store.model.Store;

@Service
public class ProductViewBO {

	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private StoreBO storeBO;
	
	@Autowired
	private OrderBO orderBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	@Autowired
	private QnaBO qnaBO;
	
	public List<ProductView> generateProductViewList(
			@RequestParam(value="storeId", required=false) Integer storeId) {
		List<ProductView> productViewList = new ArrayList<>();
		List<Product> productList = new ArrayList<>();
		
		if (storeId == null) {
			productList = productBO.getProductList();
		} else {
			productList = productBO.getProductListByStoreId(storeId);
		}
		
		for (Product product : productList) {
			ProductView productView = new ProductView();
			productView.setProduct(product);
			
			int pId = product.getId();
			int sId = product.getStoreId();
			
			List<ProductFile> files = productBO.getProductFileListByProductId(pId);
			productView.setFiles(files);
			
			Store store = storeBO.getStorById(sId);
			productView.setStore(store);
			
			List<Order> orderList = orderBO.getOrderListByProductId(pId);
			productView.setOrderList(orderList);
			
			int orderCount = orderBO.orderCountByProductId(pId);
			productView.setOrderCount(orderCount);
			
			List<Review> reviewList = reviewBO.getReviewListByProductId(pId);
			productView.setReviewList(reviewList);
			
			List<Qna> qnaList = qnaBO.getQnaListByProductId(pId);
			productView.setQnaList(qnaList);
			
			productViewList.add(productView);
		}
		return productViewList;
	}
	
	public ProductView generateProductView(
			@RequestParam("productId") int productId) {
		ProductView productView = new ProductView();
		
		Product product = productBO.getProductById(productId);
		productView.setProduct(product);
		
		int sId = product.getStoreId();
		
		List<ProductFile> files = productBO.getProductFileListByProductId(productId);
		productView.setFiles(files);
		
		Store store = storeBO.getStorById(sId);
		productView.setStore(store);
		
		List<Order> orderList = orderBO.getOrderListByProductId(productId);
		productView.setOrderList(orderList);
		
		int orderCount = orderBO.orderCountByProductId(productId);
		productView.setOrderCount(orderCount);
		
		List<Review> reviewList = reviewBO.getReviewListByProductId(productId);
		productView.setReviewList(reviewList);
		
		int pointAvg = reviewBO.getPointAverage(productId);
		productView.setPointAvg(pointAvg);
		
		List<Qna> qnaList = qnaBO.getQnaListByProductId(productId);
		productView.setQnaList(qnaList);
		
		return productView;
	}
}
