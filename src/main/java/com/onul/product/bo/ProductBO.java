package com.onul.product.bo;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.onul.common.FileManagerService;
import com.onul.product.dao.ProductDAO;
import com.onul.product.model.Product;
import com.onul.product.model.ProductFile;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductBO {

	@Autowired
	private FileManagerService fms;
	
	@Autowired
	private ProductDAO productDAO;
	
	public List<Product> getProductList() {
		return productDAO.selectProductList();
	}
	
	public List<Product> getProductListBySalesType(String salesType) {
		return productDAO.selectProductListBySalesType(salesType);
	}
	
	public List<Product> getProductListByStoreId(int storeId) {
		return productDAO.selectProductListByStoreId(storeId);
	}
	
	public Product getProductById(int id) {
		return productDAO.selectProductById(id);
	}
	
	public List<ProductFile> getProductFileListByProductId(int productId) {
		return productDAO.selectProductFileListByProductId(productId);
	}
	
	public int addProduct(Product product, MultipartFile thumbnailFile, List<MultipartFile> files, String loginId) {
		// 썸네일 저장 후 product에 set
		String thumbnail = fms.saveFile(loginId, thumbnailFile);
		product.setThumbNail(thumbnail);
		
		String imagePath = null;
		List<String> imagePaths = null;
		
		// insert
		int count = productDAO.insertProduce(product);
		if (count < 1) {
			return 0;
		}
		int productId = product.getId();
		
		if (files != null) {
			if (files.size() == 1) {
				imagePath = fms.saveFile(loginId, files.get(0));
				productDAO.insertFile(productId, imagePath);
			} else {
				try {
					imagePaths = fms.saveFiles(loginId, files);
					for (int i = 0; i < imagePaths.size(); i++) {
						productDAO.insertFile(productId, imagePaths.get(i));
					}
				} catch (IOException e) {
					log.error("[product create] 첨부파일 저장 실패");
				}
			}
		}
		return productId;
	}
}
