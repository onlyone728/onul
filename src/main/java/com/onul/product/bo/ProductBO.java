package com.onul.product.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.onul.product.dao.ProductDAO;
import com.onul.product.model.Product;

@Service
public class ProductBO {

	@Autowired
	private ProductDAO productDAO;
	
	public List<Product> getProductListBySalesType(String salesType) {
		return productDAO.selectProductListBySalesType(salesType);
	}
}
