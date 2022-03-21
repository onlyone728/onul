package com.onul.product.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.onul.product.model.Product;

@Repository
public interface ProductDAO {

	public List<Product> selectProductListBySalesType(String salesType);
}
