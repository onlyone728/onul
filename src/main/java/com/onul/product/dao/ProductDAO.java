package com.onul.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.onul.product.model.Product;
import com.onul.product.model.ProductFile;

@Repository
public interface ProductDAO {

	public List<Product> selectProductList();
	
	public List<Product> selectProductListBySalesType(String salesType);
	
	public List<Product> selectProductListByStoreId(int storeId);
	
	public Product selectProductById(int id);
	
	public int insertProduce(Product product);
	
	public List<ProductFile> selectProductFileListByProductId(int productId);
	
	public void insertFile(
			@Param("productId") int productId, 
			@Param("imagePath") String imagePath);
}
